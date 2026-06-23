# Performance Second-Pass Optimization Report

This report documents the concrete second-pass performance changes made to the React, TypeScript, React Router, Supabase, Tailwind multi-tenant app.

## 1. AuthContext Owns Profile Loading

### Before

`AuthContext` only exposed auth session state:

```ts
interface AuthContextType {
  user: User | null;
  session: Session | null;
  loading: boolean;
  signUp: (...) => Promise<{ error: Error | null }>;
  signIn: (...) => Promise<{ error: Error | null }>;
  signOut: () => Promise<void>;
}
```

Tenant and admin flows then performed their own `profiles` lookups.

### After

`AuthContext` now loads and exposes profile data:

```ts
export interface Profile {
  id: string;
  email: string | null;
  name: string | null;
  phone: string | null;
  department: string | null;
  year: string | null;
  role: string | null;
  tenant_id: string | null;
  created_at?: string | null;
}

interface AuthContextType {
  user: User | null;
  session: Session | null;
  profile: Profile | null;
  loading: boolean;
}
```

Profile loading is guarded by user id so token refreshes do not repeatedly fetch the same profile:

```ts
if (nextUserId) {
  if (profileUserIdRef.current !== nextUserId) {
    await loadProfile(nextUserId);
  }
}
```

### Why This Improves Performance

Profile data becomes a single source of truth and avoids duplicate `profiles` requests from layout and admin flows.

### Estimated Impact

High.

### Risk

Low. Access checks now depend on `AuthContext.profile` being synchronized. Signup explicitly refreshes profile after profile upsert.

## 2. TenantLayout Membership Query Removed

### Before

`TenantLayout` queried Supabase to verify tenant access:

```ts
const { data, error: profileError } = await supabase
  .from("profiles")
  .select("tenant_id")
  .eq("id", user.id)
  .maybeSingle();

setHasTenantAccess(data?.tenant_id === tenant.id);
```

It also carried membership loading state and cache logic.

### After

`TenantLayout` uses the profile already loaded by `AuthContext`:

```ts
const { user, profile, loading: authLoading, signOut } = useAuth();

const hasTenantAccess = useMemo(
  () => !user || !tenant?.id || profile?.tenant_id === tenant.id,
  [user, tenant?.id, profile?.tenant_id]
);
```

### Why This Improves Performance

Tenant route rendering no longer waits for a separate `profiles.select("tenant_id")` request.

### Estimated Impact

High.

### Risk

Low. Behavior remains equivalent because the same `tenant_id` is checked, just from the shared profile state.

## 3. Full-Screen Blocking Loaders Replaced

### Before

Auth and tenant loading showed full-screen blocking loaders:

```tsx
return (
  <div className="min-h-screen flex items-center justify-center bg-background">
    <div className="text-center">
      <div className="w-12 h-12 rounded-xl bg-primary mx-auto mb-4 animate-pulse" />
      <p className="text-muted-foreground">Loading...</p>
    </div>
  </div>
);
```

### After

A reusable content skeleton was added:

```tsx
export const PageSkeleton = memo(PageSkeletonComponent);
```

`TenantLayout` now renders normal layout chrome with only content skeletonized:

```tsx
if (tenantLoading || authLoading) {
  return (
    <Layout>
      <PageSkeleton />
    </Layout>
  );
}
```

`ProtectedRoute` now returns:

```tsx
return <PageSkeleton />;
```

### Why This Improves Performance

The navbar and page layout can paint immediately, improving perceived route speed.

### Estimated Impact

Medium.

### Risk

Low. Only loading presentation changed.

## 4. Route-Level Code Splitting

### Before

Major pages were statically imported in `App.tsx`:

```ts
import Events from "./pages/Events";
import Problems from "./pages/Problems";
import AdminDashboard from "./pages/AdminDashboard";
```

### After

Major pages are lazy-loaded:

```ts
const Events = lazy(() => import("./pages/Events"));
const Problems = lazy(() => import("./pages/Problems"));
const AdminDashboard = lazy(() => import("./pages/AdminDashboard"));
```

Routes are wrapped with:

```tsx
<Suspense fallback={<PageSkeleton />}>
  <Routes>{/* routes */}</Routes>
</Suspense>
```

### Why This Improves Performance

The initial JavaScript bundle no longer includes every major route upfront.

### Estimated Impact

High.

### Risk

Low. First visit to each route fetches that route chunk.

## 5. Manual Vendor Chunk Splitting

### Before

The shared entry chunk was large:

```txt
assets/index-CzS5l8Q5.js 508.54 kB
```

### After

`vite.config.ts` now splits large vendors:

```ts
manualChunks: {
  react: ["react", "react-dom", "react-router-dom"],
  supabase: ["@supabase/supabase-js"],
  ui: [
    "@radix-ui/react-dialog",
    "@radix-ui/react-dropdown-menu",
    "@radix-ui/react-select",
    "@radix-ui/react-toast",
    "lucide-react",
  ],
  charts: ["recharts"],
}
```

The entry chunk became:

```txt
assets/index-BVCbdICE.js 117.09 kB
```

### Why This Improves Performance

Vendor code can be cached independently, and route chunks are smaller.

### Estimated Impact

High.

### Risk

Low. More chunks are requested, but caching and route loading improve.

## 6. Context and Navbar Re-render Optimization

### Before

`AuthContext.Provider` recreated its value object every render:

```tsx
<AuthContext.Provider value={{ user, session, loading, signUp, signIn, signOut }}>
  {children}
</AuthContext.Provider>
```

`Navbar` recreated path helpers, nav link arrays, and signout callbacks every render.

### After

`AuthContext` memoizes provider value:

```ts
const value = useMemo(
  () => ({ user, session, profile, loading, signUp, signIn, signOut }),
  [user, session, profile, loading, signUp, signIn, signOut]
);
```

`Navbar` now uses `memo`, `useMemo`, and `useCallback`:

```ts
const path = useCallback((value: string) => tenantPath(slug, value), [slug]);
const navLinks = useMemo(() => [...], [isAdmin, path]);
export const Navbar = memo(NavbarComponent);
```

### Why This Improves Performance

Consumers avoid unnecessary renders when context data and derived navbar values have not actually changed.

### Estimated Impact

Medium.

### Risk

Low.

## 7. Supabase `select("*")` Removed

### Before

Hot routes fetched full rows:

```ts
.from("events").select("*")
.from("problem_statements").select("*")
.from("page_content").select("*")
.from("team_registrations").select("*")
```

### After

Queries now request only used fields.

Examples:

```ts
.from("events")
.select("id,title,description,event_date,location,event_type,mode,organizer_name,organizer_contact,registration_deadline,registration_link,max_participants,is_active,image_url")
```

```ts
.from("problem_statements")
.select("id,problem_statement_id,title,description,detailed_description,category,theme,department,status,created_at,approved_at,max_registrations,curr_registrations")
```

```ts
.from("page_content")
.select("section_key,content")
```

```ts
.from("tenants")
.select("id,name,slug,created_at")
```

### Why This Improves Performance

Smaller payloads reduce network transfer, JSON parsing, and object allocation.

### Estimated Impact

Medium.

### Risk

Medium-low. Future UI additions must add newly needed fields explicitly.

## 8. Admin Query List N+1 Removed

### Before

Each user query with a `user_id` performed a separate profile request:

```ts
const queriesWithProfiles = await Promise.all(
  data.map(async (query) => {
    const { data: profile } = await supabase
      .from("profiles")
      .select("name, email")
      .eq("id", query.user_id)
      .single();
  })
);
```

### After

Profiles are fetched once in a batch:

```ts
const userIds = [...new Set((data || []).map((query) => query.user_id).filter(Boolean))] as string[];

const { data: profiles } = await supabase
  .from("profiles")
  .select("id,name,email")
  .eq("tenant_id", tenant!.id)
  .in("id", userIds);
```

### Why This Improves Performance

Admin query loading changes from `1 + N` profile requests to at most `2` total requests.

### Estimated Impact

High on the admin resources query list.

### Risk

Low.

## 9. Client-Side Prefetching After Login

### Before

After login, tenant/dashboard-adjacent data was fetched only after route navigation mounted components.

### After

After profile load, common tenant data is prefetched in the background:

```ts
void Promise.allSettled([
  supabase.from("tenants").select("id,name,slug,created_at").eq("id", tenantId).maybeSingle(),
  supabase.from("events").select("...").eq("tenant_id", tenantId).eq("is_active", true),
  supabase.from("problem_statements").select("...").eq("tenant_id", tenantId).eq("status", "approved"),
  supabase.from("page_content").select("page_name,section_key,content,updated_at").eq("tenant_id", tenantId),
]);
```

### Why This Improves Performance

Common data is requested earlier, so dashboard and common tenant route transitions feel faster.

### Estimated Impact

Medium.

### Risk

Medium-low. Prefetching adds non-blocking requests after login, but they are guarded per tenant id.

## 10. CSS Build Warning Fixed

### Before

`@import` appeared after Tailwind directives:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

@import url(...);
```

### After

`@import` now appears first:

```css
@import url(...);

@tailwind base;
@tailwind components;
@tailwind utilities;
```

### Why This Improves Performance

This removes CSS bundler ordering warnings and avoids stylesheet ordering surprises.

### Estimated Impact

Low.

### Risk

Low.

## Database Index Recommendations

These are based on actual Supabase query patterns in the codebase.

```sql
create index if not exists idx_tenants_slug
on tenants(slug);

create index if not exists idx_profiles_tenant_id
on profiles(tenant_id);

create index if not exists idx_user_roles_tenant_user
on user_roles(tenant_id, user_id);

create index if not exists idx_events_tenant_active_date
on events(tenant_id, is_active, event_date);

create index if not exists idx_problem_statements_tenant_status_id
on problem_statements(tenant_id, status, problem_statement_id);

create index if not exists idx_problem_statements_tenant_status_created
on problem_statements(tenant_id, status, created_at);

create index if not exists idx_page_content_tenant_page_section
on page_content(tenant_id, page_name, section_key);

create index if not exists idx_team_registrations_tenant
on team_registrations(tenant_id);

create index if not exists idx_resources_tenant_section
on resources(tenant_id, section_key);

create index if not exists idx_user_queries_tenant_created
on user_queries(tenant_id, created_at desc);

create index if not exists idx_themes_tenant_name
on themes(tenant_id, name);
```

## Build Verification

Command:

```bash
npm run build
```

Result:

```txt
vite build completed successfully.
```

Final bundle highlights:

```txt
assets/index-BVCbdICE.js      117.09 kB
assets/react-DAqZ9rsH.js      162.49 kB
assets/supabase-MEHSyf2E.js   171.57 kB
assets/charts-CIyPQ3Yy.js     359.41 kB
```

Only remaining notice:

```txt
Browserslist: browsers data is 12 months old.
```

This is dependency metadata freshness, not a build failure.

## Estimated Overall Impact

- Initial entry bundle reduced from about `508.54 kB` to about `117.09 kB`.
- Tenant page transitions remove one blocking profile membership request.
- Admin checks remove one redundant profile confirmation request.
- Admin query list avoids N+1 profile fetching.
- Route transitions improve because major pages are lazy-loaded.
- Perceived loading improves because layout renders before content skeletons.

## Remaining Bottlenecks

- Supabase still performs page-level round trips on many pages.
- Admin dashboard still loads several datasets at once, though the heavy chart library is now isolated.
- More gains are possible by moving repeated page data to React Query with shared query keys and cache hydration.
- Database indexes should be applied and validated with Supabase query plans.
