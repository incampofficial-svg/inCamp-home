import { useState, useEffect, useMemo } from "react";
import { useAuth } from "@/contexts/AuthContext";
import { supabase } from "@/integrations/supabase/client";
import { useTenant } from "@/context/TenantContext";

export function useAdmin() {
  const { user, profile, loading: authLoading } = useAuth();
  const [isAdmin, setIsAdmin] = useState(false);
  const [isDeptAdmin, setIsDeptAdmin] = useState(false);
  const [loading, setLoading] = useState(true);
  const [hasAdminRoleElsewhere, setHasAdminRoleElsewhere] = useState(false);
  const { tenant } = useTenant();
  const hasCurrentTenantProfile = useMemo(
    () => !!user && !!tenant?.id && profile?.tenant_id === tenant.id,
    [user, tenant?.id, profile?.tenant_id]
  );

  useEffect(() => {
    const checkAdminRole = async () => {
      if (authLoading || !user || !tenant?.id) {
        setIsAdmin(false);
        setIsDeptAdmin(false);
        setLoading(authLoading);
        return;
      }

      try {
        setLoading(true);

        // Fetch roles for the user in the active tenant only.
        const { data: rolesData, error: rolesError } = await supabase
          .from("user_roles")
          .select("role")
          .eq("user_id", user.id)
          .eq("tenant_id", tenant.id);

        if (rolesError) throw rolesError;

        const roles = (rolesData || []).map((r: any) => String(r.role));
        const hasAdminRole = roles.includes("admin") || roles.includes("institution_admin");
        const hasDeptAdminRole = roles.includes("deptadmin") || roles.includes("department_admin");

        if (hasAdminRole && hasCurrentTenantProfile) {
          setIsAdmin(true);
          setIsDeptAdmin(false);
          setHasAdminRoleElsewhere(false);
        } else if (hasDeptAdminRole && hasCurrentTenantProfile) {
          setIsAdmin(false);
          setIsDeptAdmin(true);
          setHasAdminRoleElsewhere(false);
        } else {
          setIsAdmin(false);
          setIsDeptAdmin(false);
          const { data: otherRoles } = await supabase
            .from("user_roles")
            .select("role")
            .eq("user_id", user.id)
            .neq("tenant_id", tenant.id);

          setHasAdminRoleElsewhere(
            (otherRoles || []).some((r: any) =>
              ["admin", "institution_admin", "deptadmin", "department_admin"].includes(String(r.role))
            )
          );
        }
      } catch (err) {
        console.error("Error checking admin role:", err);
        setIsAdmin(false);
        setIsDeptAdmin(false);
        setHasAdminRoleElsewhere(false);
      } finally {
        setLoading(false);
      }
    };

    checkAdminRole();
  }, [authLoading, user, tenant?.id, hasCurrentTenantProfile]);

  return { isAdmin, isDeptAdmin, loading, hasAdminRoleElsewhere };
}
