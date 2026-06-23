import { createContext, ReactNode, useContext, useEffect, useMemo, useState, useRef } from "react";
import { supabase } from "@/integrations/supabase/client";
import type { Tenant } from "@/types/tenant";

interface TenantContextValue {
  tenant: Tenant | null;
  loading: boolean;
  error: string | null;
}

const TenantContext = createContext<TenantContextValue | undefined>(undefined);

// Module-level cache for tenant data - persists across component remounts
const tenantCacheRef = { current: new Map<string, Tenant>() };

interface TenantProviderProps {
  tenantSlug: string | undefined;
  children: ReactNode;
}

export function TenantProvider({ tenantSlug, children }: TenantProviderProps) {
  const [tenant, setTenant] = useState<Tenant | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const previousSlugRef = useRef<string | undefined>();

  useEffect(() => {
    let cancelled = false;

    const fetchTenant = async () => {
      if (!tenantSlug) {
        setTenant(null);
        setError("Tenant not found");
        setLoading(false);
        return;
      }

      // **OPTIMIZATION: Check cache first**
      const cached = tenantCacheRef.current.get(tenantSlug);
      if (cached) {
        if (!cancelled) {
          setTenant(cached);
          setError(null);
          setLoading(false);
        }
        return;
      }

      // Only show loading if we're changing tenants (not on first load with cache)
      if (previousSlugRef.current !== tenantSlug) {
        setLoading(true);
      }
      setError(null);

      const { data, error: tenantError } = await (supabase as any)
        .from("tenants")
        .select("id,name,slug,created_at")
        .eq("slug", tenantSlug)
        .single();

      if (cancelled) return;

      if (tenantError || !data) {
        setTenant(null);
        setError("Tenant not found");
      } else {
        // **OPTIMIZATION: Store in cache**
        tenantCacheRef.current.set(tenantSlug, data as Tenant);
        setTenant(data as Tenant);
        setError(null);
      }

      setLoading(false);
      previousSlugRef.current = tenantSlug;
    };

    void fetchTenant();

    return () => {
      cancelled = true;
    };
  }, [tenantSlug]);

  const value = useMemo(
    () => ({ tenant, loading, error }),
    [tenant, loading, error]
  );

  return <TenantContext.Provider value={value}>{children}</TenantContext.Provider>;
}

export function useTenant() {
  const context = useContext(TenantContext);
  if (!context) {
    throw new Error("useTenant must be used within a TenantProvider");
  }
  return context;
}
