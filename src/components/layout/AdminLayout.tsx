import { ReactNode } from "react";
import { Navbar } from "./Navbar";
import { Footer } from "./Footer";
import { useAdmin } from "@/hooks/useAdmin";
import { Layout } from "./Layout";

interface AdminLayoutProps {
  children: ReactNode;
}

export function AdminLayout({ children }: AdminLayoutProps) {
  const { loading, hasAdminRoleElsewhere } = useAdmin() as any;

  // While loading, render normal layout to avoid blocking render cycle
  if (loading) {
    return (
      <div className="min-h-screen flex flex-col">
        <Navbar />
        <main className="flex-1 pt-16 lg:pt-20">{children}</main>
        <Footer />
      </div>
    );
  }

  // If the user has an admin role but for a different tenant, show access denied
  if (hasAdminRoleElsewhere) {
    return (
      <div className="min-h-screen flex flex-col">
        <Navbar />
        <main className="flex-1 pt-16 lg:pt-20">
          <div className="container mx-auto px-4 py-24">
            <div className="max-w-xl mx-auto bg-card rounded-lg p-8 shadow">
              <h2 className="text-xl font-semibold mb-2">Access Denied</h2>
              <p className="text-muted-foreground">
                You have administrative privileges, but not for this tenant. You cannot access admin features for other tenants.
              </p>
            </div>
          </div>
        </main>
        <Footer />
      </div>
    );
  }

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <main className="flex-1 pt-16 lg:pt-20">{children}</main>
      <Footer />
    </div>
  );
}
