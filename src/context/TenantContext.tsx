import { createContext, ReactNode, useContext, useEffect, useMemo, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import type { Tenant } from "@/types/tenant";

interface TenantContextValue {
  tenant: Tenant | null;
  loading: boolean;
  error: string | null;
}

const TenantContext = createContext<TenantContextValue | undefined>(undefined);

interface TenantProviderProps {
  tenantSlug: string | undefined;
  children: ReactNode;
}

export function TenantProvider({ tenantSlug, children }: TenantProviderProps) {
  const [tenant, setTenant] = useState<Tenant | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    let cancelled = false;

    const fetchTenant = async () => {
      if (!tenantSlug) {
        setTenant(null);
        setError("Tenant not found");
        setLoading(false);
        return;
      }

      setLoading(true);
      setError(null);

      const { data, error: tenantError } = await (supabase as any)
        .from("tenants")
        .select("*")
        .eq("slug", tenantSlug)
        .single();

      if (cancelled) return;

      if (tenantError || !data) {
        setTenant(null);
        setError("Tenant not found");
      } else {
        setTenant(data as Tenant);
        setError(null);
      }

      setLoading(false);
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
