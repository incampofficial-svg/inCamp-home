import { Outlet, useParams } from "react-router-dom";
import { AlertCircle } from "lucide-react";
import { TenantProvider, useTenant } from "@/context/TenantContext";

function TenantContent() {
  const { loading, error } = useTenant();

  if (loading) {
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
