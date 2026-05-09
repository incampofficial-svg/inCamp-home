export function tenantPath(tenantSlug: string, path: string) {
  const cleanSlug = tenantSlug.replace(/^\/+|\/+$/g, "");
  const cleanPath = path.startsWith("/") ? path : `/${path}`;

  if (!cleanSlug) {
    return cleanPath;
  }

  if (!cleanPath || cleanPath === "/") {
    return `/${cleanSlug}`;
  }

  return `/${cleanSlug}${cleanPath}`;
}
