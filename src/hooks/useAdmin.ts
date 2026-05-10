import { useState, useEffect } from "react";
import { useAuth } from "@/contexts/AuthContext";
import { supabase } from "@/integrations/supabase/client";
import { useTenant } from "@/context/TenantContext";

export function useAdmin() {
  const { user } = useAuth();
  const [isAdmin, setIsAdmin] = useState(false);
  const [loading, setLoading] = useState(true);
  const [hasAdminRoleElsewhere, setHasAdminRoleElsewhere] = useState(false);
  const { tenant } = useTenant();

  useEffect(() => {
    const checkAdminRole = async () => {
      if (!user) {
        setIsAdmin(false);
        setLoading(false);
        return;
      }

      try {
        // Fetch all roles for the user
        const { data: rolesData, error: rolesError } = await supabase
          .from("user_roles")
          .select("role")
          .eq("user_id", user.id);

        if (rolesError) throw rolesError;

        const roles = (rolesData || []).map((r: any) => String(r.role));
        const hasAdminRole = roles.includes("admin") || roles.includes("deptadmin");

        // Fetch user's profile to read their tenant assignment
        const { data: profileData, error: profileError } = await supabase
          .from("profiles")
          .select("tenant_id")
          .eq("id", user.id)
          .maybeSingle();

        if (profileError) throw profileError;

        const userTenantId = profileData?.tenant_id || null;

        if (hasAdminRole && tenant && userTenantId && tenant.id === userTenantId) {
          setIsAdmin(true);
          setHasAdminRoleElsewhere(false);
        } else if (hasAdminRole && tenant && userTenantId && tenant.id !== userTenantId) {
          // User is an admin somewhere, but not for the current tenant
          setIsAdmin(false);
          setHasAdminRoleElsewhere(true);
        } else {
          setIsAdmin(false);
          setHasAdminRoleElsewhere(false);
        }
      } catch (err) {
        console.error("Error checking admin role:", err);
        setIsAdmin(false);
        setHasAdminRoleElsewhere(false);
      } finally {
        setLoading(false);
      }
    };

    checkAdminRole();
  }, [user]);

  return { isAdmin, loading, hasAdminRoleElsewhere };
}
