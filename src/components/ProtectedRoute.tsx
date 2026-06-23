import { Navigate, useLocation } from "react-router-dom";
import { useAuth } from "@/contexts/AuthContext";
import { useTenant } from "@/context/TenantContext";
import { tenantPath } from "@/utils/tenantPath";
import { useAdmin } from "@/hooks/useAdmin";
import { PageSkeleton } from "@/components/PageSkeleton";

interface ProtectedRouteProps {
  children: React.ReactNode;
  requireAdmin?: boolean;
}

export function ProtectedRoute({ children, requireAdmin = false }: ProtectedRouteProps) {
  const { user, loading } = useAuth();
  const { tenant } = useTenant();
  const { isAdmin, loading: adminLoading } = useAdmin();
  const location = useLocation();

  if (loading || (requireAdmin && adminLoading)) {
    return <PageSkeleton />;
  }

  if (!user) {
    // Redirect to auth page, preserving the intended destination
    return <Navigate to={tenantPath(tenant!.slug, "/auth")} state={{ from: location }} replace />;
  }

  if (requireAdmin && !isAdmin) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-background px-4">
        <div className="max-w-md text-center bg-card rounded-lg p-8 shadow">
          <h1 className="text-2xl font-semibold text-foreground mb-2">Access denied</h1>
          <p className="text-muted-foreground">
            This page is only available to admins for this tenant.
          </p>
        </div>
      </div>
    );
  }

  return <>{children}</>;
}
