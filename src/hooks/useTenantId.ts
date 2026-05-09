import { useTenant } from "@/context/TenantContext";

export function useTenantId() {
  const { tenant, loading } = useTenant();

  if (!tenant?.id) {
    throw new Error(
      loading
        ? "Tenant is still loading. Read tenant_id after loading completes."
        : "Tenant is unavailable. Ensure this component is rendered inside a valid tenant route."
    );
  }

  return tenant.id;
}
