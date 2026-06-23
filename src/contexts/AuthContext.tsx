import { createContext, useCallback, useContext, useEffect, useMemo, useRef, useState, ReactNode } from "react";
import { User, Session } from "@supabase/supabase-js";
import { supabase } from "@/integrations/supabase/client";

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
  signUp: (
    email: string,
    password: string,
    name: string,
    department: string,
    year: string,
    tenantId?: string
  ) => Promise<{ error: Error | null }>;
  signIn: (email: string, password: string) => Promise<{ error: Error | null }>;
  signOut: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);
const prefetchedTenantIds = new Set<string>();

const prefetchTenantData = (tenantId: string) => {
  if (prefetchedTenantIds.has(tenantId)) return;
  prefetchedTenantIds.add(tenantId);

  void Promise.allSettled([
    supabase.from("tenants").select("id,name,slug,created_at").eq("id", tenantId).maybeSingle(),
    supabase
      .from("events")
      .select("id,title,description,event_date,location,event_type,mode,registration_deadline,registration_link,max_participants,is_active,image_url")
      .eq("tenant_id", tenantId)
      .eq("is_active", true)
      .order("event_date", { ascending: true }),
    supabase
      .from("problem_statements")
      .select("id,problem_statement_id,title,description,detailed_description,category,theme,department,status,created_at,approved_at,max_registrations,curr_registrations")
      .eq("tenant_id", tenantId)
      .eq("status", "approved")
      .order("problem_statement_id", { ascending: true }),
    supabase
      .from("page_content")
      .select("page_name,section_key,content,updated_at")
      .eq("tenant_id", tenantId)
      .in("page_name", ["home", "events", "contact"]),
  ]);
};

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [session, setSession] = useState<Session | null>(null);
  const [profile, setProfile] = useState<Profile | null>(null);
  const [loading, setLoading] = useState(true);
  const initializationStartedRef = useRef(false);
  const profileRequestRef = useRef(0);
  const profileUserIdRef = useRef<string | null>(null);

  const loadProfile = useCallback(async (userId: string) => {
    const requestId = ++profileRequestRef.current;

    const { data, error } = await supabase
      .from("profiles")
      .select("id,email,name,phone,department,year,role,tenant_id,created_at")
      .eq("id", userId)
      .maybeSingle();

    if (requestId !== profileRequestRef.current) return null;

    if (error) {
      console.error("Profile load error:", error);
      setProfile(null);
      return null;
    }

    const nextProfile = (data as Profile | null) ?? null;
    profileUserIdRef.current = userId;
    setProfile(nextProfile);

    if (nextProfile?.tenant_id) {
      prefetchTenantData(nextProfile.tenant_id);
    }

    return nextProfile;
  }, []);

  const applySession = useCallback(
    async (nextSession: Session | null) => {
      const nextUserId = nextSession?.user?.id ?? null;
      setSession(nextSession);
      setUser(nextSession?.user ?? null);

      if (nextUserId) {
        if (profileUserIdRef.current !== nextUserId) {
          await loadProfile(nextUserId);
        }
      } else {
        profileRequestRef.current += 1;
        profileUserIdRef.current = null;
        setProfile(null);
      }
    },
    [loadProfile]
  );

  useEffect(() => {
    // Prevent multiple simultaneous initializations
    if (initializationStartedRef.current) {
      return;
    }
    initializationStartedRef.current = true;

    let isMounted = true;

    const initializeAuth = async () => {
      try {
        // Get existing session (this is the PRIMARY source of truth)
        const { data: { session: currentSession }, error } = await supabase.auth.getSession();
        if (error) throw error;
        
        if (!isMounted) return;

        await applySession(currentSession);

        // Set up listener AFTER initial session is loaded
        const { data: { subscription } } = supabase.auth.onAuthStateChange(
          (_event, newSession) => {
            if (!isMounted) return;
            void applySession(newSession);
          }
        );

        // Mark initialization as complete
        if (isMounted) {
          setLoading(false);
        }

        return () => subscription.unsubscribe();
      } catch (err) {
        console.error("Auth initialization error:", err);
        if (isMounted) {
          setLoading(false);
        }
      }
    };

    const unsubscribe = initializeAuth().then(fn => fn);

    return () => {
      isMounted = false;
      unsubscribe.then(fn => fn?.());
    };
  }, [applySession]);

const signUp = useCallback(async (
  email: string,
  password: string,
  name: string,
  department: string,
  year: string,
  tenantId?: string
) => {
  const redirectUrl = `${window.location.origin}${window.location.pathname}`;

    const { data, error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        emailRedirectTo: redirectUrl,
        data: {
            name,
            department,
            year,
            tenant_id: tenantId,
        },
      },
    });

    if (!error && data.user && tenantId) {
      const { error: profileError } = await (supabase as any)
        .from("profiles")
        .upsert(
          {
            id: data.user.id,
            email,
            name,
            tenant_id: tenantId,
          },
          { onConflict: "id" }
        );

      if (profileError) {
        console.warn("Profile tenant assignment warning:", profileError.message);
      } else {
        await loadProfile(data.user.id);
      }
    }

    return { error: error as Error | null };
  }, [loadProfile]);

  const signIn = useCallback(async (email: string, password: string) => {
    const { error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });
    return { error: error as Error | null };
  }, []);

  const signOut = useCallback(async () => {
    try {
      // Use 'local' scope to prevent 403 errors when the session is already expired.
      // Global scope attempts to invalidate the token on the server, which fails if it's already expired.
      const { error } = await supabase.auth.signOut({ scope: "local" });
      if (error) {
        console.warn("Supabase sign out warning:", error.message);
      }
    } catch (err) {
      console.error("Unexpected error during sign out:", err);
    } finally {
      // Force clear local React state to prevent stale data
      setUser(null);
      setSession(null);
      profileUserIdRef.current = null;
      setProfile(null);
      // Cleanly redirect to login page (which is the root "/")
      // Using replace to prevent navigating back to a protected route
      const tenantSlug = window.location.pathname.split("/").filter(Boolean)[0];
      window.location.replace(tenantSlug ? `/${tenantSlug}` : "/");
    }
  }, []);

  const value = useMemo(
    () => ({ user, session, profile, loading, signUp, signIn, signOut }),
    [user, session, profile, loading, signUp, signIn, signOut]
  );

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error("useAuth must be used within an AuthProvider");
  }
  return context;
}
