import { useMemo } from "react";
import { Outlet, useParams } from "react-router-dom";
import { AlertCircle } from "lucide-react";
import { TenantProvider, useTenant } from "@/context/TenantContext";
import { useAuth } from "@/contexts/AuthContext";
import { FaviconUpdater } from "@/components/FaviconUpdater";
import { Button } from "@/components/ui/button";
import { Layout } from "@/components/layout/Layout";
import { PageSkeleton } from "@/components/PageSkeleton";

function TenantContent() {
  const { tenant, loading: tenantLoading, error: tenantError } = useTenant();
  const { user, profile, loading: authLoading, signOut } = useAuth();
  const hasTenantAccess = useMemo(
    () => !user || !tenant?.id || profile?.tenant_id === tenant.id,
    [user, tenant?.id, profile?.tenant_id]
  );

  if (tenantLoading || authLoading) {
    return (
      <Layout>
        <PageSkeleton />
      </Layout>
    );
  }

  if (tenantError) {
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

  return (
    <>
      <FaviconUpdater />
      <Outlet />
    </>
  );
}

export default function TenantLayout() {
  const { tenantSlug } = useParams<{ tenantSlug: string }>();

  return (
    <TenantProvider tenantSlug={tenantSlug}>
      <TenantContent />
    </TenantProvider>
  );
}
