import { useEffect } from "react";
import { useAuth } from "@/contexts/AuthContext";
import { useAdmin } from "@/hooks/useAdmin";

export function FaviconUpdater() {
  const { user } = useAuth();
  const { isAdmin } = useAdmin();

  useEffect(() => {
    const favicon = document.querySelector("link[rel='icon']") as HTMLLinkElement;
    if (favicon) {
      favicon.href = isAdmin ? "/favicon-admin.png" : "/favicon.png";
    }
  }, [isAdmin]);

  return null;
}
