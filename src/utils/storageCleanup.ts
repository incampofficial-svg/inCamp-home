import { supabase } from "@/integrations/supabase/client";

/**
 * Extract the file path within a Supabase storage bucket from a public URL.
 *
 * A typical Supabase public URL looks like:
 *   https://<project>.supabase.co/storage/v1/object/public/<bucket>/<path>
 *
 * This function returns only `<path>`, which is what the storage API expects.
 */
function extractStoragePath(url: string, bucketName: string): string | null {
  try {
    const parsed = new URL(url);
    const bucketPrefix = `/storage/v1/object/public/${bucketName}/`;
    const idx = parsed.pathname.indexOf(bucketPrefix);
    if (idx !== -1) {
      return parsed.pathname.substring(idx + bucketPrefix.length);
    }
    return null;
  } catch {
    return null;
  }
}

/**
 * Permanently delete one or more files from a Supabase storage bucket.
 *
 * @param urls    - Array of full public URLs pointing to bucket objects.
 * @param bucket  - The bucket name (defaults to "resources").
 *
 * @returns `true` if all deletions succeeded (or there was nothing to delete),
 *          `false` if any error occurred.
 */
export async function deleteStorageFiles(
  urls: string[],
  bucket = "resources"
): Promise<boolean> {
  if (!urls || urls.length === 0) return true;

  const paths = urls
    .map((url) => extractStoragePath(url, bucket))
    .filter(Boolean) as string[];

  if (paths.length === 0) return true;

  try {
    console.log(`[storageCleanup] Deleting from "${bucket}":`, paths);
    const { data, error } = await supabase.storage.from(bucket).remove(paths);
    if (error) throw error;
    console.log(`[storageCleanup] Deleted successfully:`, data);
    return true;
  } catch (err) {
    console.error(`[storageCleanup] Failed to delete from "${bucket}":`, err);
    return false;
  }
}
