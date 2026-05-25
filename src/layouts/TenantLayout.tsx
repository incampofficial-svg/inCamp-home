import { useEffect, useState } from "react";
import { Outlet, useParams } from "react-router-dom";
import { AlertCircle } from "lucide-react";
import { TenantProvider, useTenant } from "@/context/TenantContext";
import { useAuth } from "@/contexts/AuthContext";
import { supabase } from "@/integrations/supabase/client";
import { Button } from "@/components/ui/button";

function TenantContent() {
  const { tenant, loading, error } = useTenant();
  const { user, loading: authLoading, signOut } = useAuth();
  const [membershipLoading, setMembershipLoading] = useState(false);
  const [hasTenantAccess, setHasTenantAccess] = useState(true);

  useEffect(() => {
    if (loading || authLoading || !tenant?.id || !user) {
      setHasTenantAccess(true);
      setMembershipLoading(false);
      return;
    }

    let cancelled = false;

    const checkTenantMembership = async () => {
      setMembershipLoading(true);
      try {
        const { data, error: profileError } = await supabase
          .from("profiles")
          .select("tenant_id")
          .eq("id", user.id)
          .maybeSingle();

        if (profileError) throw profileError;
        if (!cancelled) {
          setHasTenantAccess(data?.tenant_id === tenant.id);
        }
      } catch (err) {
        console.error("Error checking tenant access:", err);
        if (!cancelled) setHasTenantAccess(false);
      } finally {
        if (!cancelled) setMembershipLoading(false);
      }
    };

    void checkTenantMembership();

    return () => {
      cancelled = true;
    };
  }, [authLoading, loading, tenant?.id, user]);

  if (loading || authLoading || membershipLoading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-background">
        <div className="text-center">
          <div className="w-12 h-12 rounded-xl bg-primary mx-auto mb-4 animate-pulse" />
          <p className="text-muted-foreground">Loading tenant...</p>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-background px-4">
        <div className="text-center max-w-md">
          <div className="w-16 h-16 rounded-xl bg-destructive/10 flex items-center justify-center mx-auto mb-4">
            <AlertCircle className="w-8 h-8 text-destructive" />
          </div>
          <h1 className="text-2xl font-poppins font-semibold text-foreground mb-2">
            Tenant not found
          </h1>
          <p className="text-muted-foreground">
            The campus you are trying to access does not exist or is not available yet.
          </p>
        </div>
      </div>
    );
  }

  if (user && !hasTenantAccess) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-background px-4">
        <div className="text-center max-w-md">
          <div className="w-16 h-16 rounded-xl bg-destructive/10 flex items-center justify-center mx-auto mb-4">
            <AlertCircle className="w-8 h-8 text-destructive" />
          </div>
          <h1 className="text-2xl font-poppins font-semibold text-foreground mb-2">
            Access denied
          </h1>
          <p className="text-muted-foreground">
            Your account is not assigned to this tenant. Sign out before viewing public pages for another tenant.
          </p>
          <Button variant="orange" className="mt-6" onClick={() => void signOut()}>
            Sign out
          </Button>
        </div>
      </div>
    );
  }

  return <Outlet />;
}

export default function TenantLayout() {
  const { tenantSlug } = useParams<{ tenantSlug: string }>();

  return (
    <TenantProvider tenantSlug={tenantSlug}>
      <TenantContent />
    </TenantProvider>
  );
}
