import { Link } from "react-router-dom";
import { Info, LogIn } from "lucide-react";
import { Button } from "@/components/ui/button";
import { useAuth } from "@/contexts/AuthContext";
import { useTenant } from "@/context/TenantContext";
import { tenantPath } from "@/utils/tenantPath";

interface LoginGateProps {
  title?: string;
  description?: string;
  actionLabel?: string;
}

export function LoginGate({
  title = "Login required",
  description = "Please log in to access this content.",
  actionLabel = "Login to continue",
}: LoginGateProps) {
  const { user, loading } = useAuth();
  const { tenant } = useTenant();

  if (loading) {
    return (
      <section className="py-24">
        <div className="container mx-auto px-4">
          <div className="rounded-3xl border border-border bg-card p-12 text-center shadow">
            <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10 text-primary">
              <Info className="h-8 w-8" />
            </div>
            <p className="text-muted-foreground">Checking your login status...</p>
          </div>
        </div>
      </section>
    );
  }

  if (user) {
    return null;
  }

  return (
    <section className="py-24">
      <div className="container mx-auto px-4">
        <div className="rounded-3xl border border-border bg-card p-10 text-center shadow-lg">
          <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10 text-primary">
            <Info className="h-8 w-8" />
          </div>
          <h2 className="text-2xl font-semibold text-foreground">{title}</h2>
          <p className="mt-3 text-sm text-muted-foreground max-w-2xl mx-auto">
            {description}
          </p>
          <Button asChild variant="orange" className="mt-8">
            <Link to={tenantPath(tenant?.slug ?? "", "/auth")}> 
              <LogIn className="mr-2 h-4 w-4" />
              {actionLabel}
            </Link>
          </Button>
        </div>
      </div>
    </section>
  );
}
