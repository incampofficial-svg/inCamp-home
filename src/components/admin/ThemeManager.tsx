import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { toast } from "sonner";
import { useTenant } from "@/context/TenantContext";

export function ThemeManager({ onClose }: { onClose?: () => void }) {
  const { tenant } = useTenant();
  const [themes, setThemes] = useState<{ id: string; name: string; description: string | null }[]>([]);
  const [newTheme, setNewTheme] = useState("");
  const [newThemeDescription, setNewThemeDescription] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchThemes = async () => {
    if (!tenant) return;
    const { data, error } = await supabase
      .from("themes")
      .select("id, name, description")
      .eq("tenant_id", tenant.id)
      .order("name", { ascending: true });

    if (error) {
      console.error("Error fetching themes:", error);
      setError(error.message);
    } else if (data) {
      setThemes(data as any);
    }
  };

  useEffect(() => {
    fetchThemes();
  }, [tenant?.id]);

  const handleAdd = async () => {
    if (!newTheme.trim() || !tenant) return;
    setLoading(true);
    setError(null);
    try {
      const { error } = await supabase.from("themes").insert({ name: newTheme.trim(), description: newThemeDescription.trim(), tenant_id: tenant.id });
      if (error) throw error;
      setNewTheme("");
      setNewThemeDescription("");
      await fetchThemes();
      toast.success("Theme added");
    } catch (err: any) {
      console.error(err);
      const message = err?.message || "Unable to add theme";
      setError(message);
      toast.error(message);
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (theme: { id: string; name: string; description: string | null }) => {
    if (!tenant) return;
    // Check if any problem_statements use this theme
    try {
      const { data: used, error: checkError } = await supabase
        .from("problem_statements")
        .select("id")
        .eq("tenant_id", tenant.id)
        .eq("theme", theme.name)
        .limit(1);

      if (checkError) throw checkError;
      if (used && used.length > 0) {
        const message = `Cannot delete theme "${theme.name}" because it is used by existing problem statements.`;
        setError(message);
        toast.error(message);
        return;
      }

      const { error } = await supabase.from("themes").delete().eq("id", theme.id).eq("tenant_id", tenant.id);
      if (error) throw error;
      await fetchThemes();
      toast.success("Theme deleted");
    } catch (err: any) {
      console.error(err);
      const message = err?.message || "Unable to delete theme";
      setError(message);
      toast.error(message);
    }
  };

  return (
    <div className="space-y-4">
      {error && (
        <div className="rounded-md p-3 bg-destructive/10 text-destructive">{error}</div>
      )}

      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <div className="sm:col-span-1">
          <Label htmlFor="new-theme">Add new theme</Label>
          <Input id="new-theme" value={newTheme} onChange={(e) => setNewTheme(e.target.value)} placeholder="Theme name" />
        </div>
        <div className="sm:col-span-1">
          <Label htmlFor="new-theme-description">Description</Label>
          <Input id="new-theme-description" value={newThemeDescription} onChange={(e) => setNewThemeDescription(e.target.value)} placeholder="Theme description" />
        </div>
        <div className="flex items-end">
          <Button onClick={handleAdd} disabled={loading || !newTheme.trim()}>
            {loading ? "Adding..." : "Add Theme"}
          </Button>
        </div>
      </div>

      <div>
        <h4 className="font-medium mb-2">Existing themes</h4>
        <div className="grid gap-2">
          {themes.length === 0 && <div className="text-muted-foreground">No themes created yet.</div>}
          {themes.map((t) => (
            <div key={t.id} className="flex items-center justify-between bg-card p-3 rounded-md">
              <div>
                <div className="capitalize font-medium">{t.name}</div>
                <div className="text-sm text-muted-foreground">{t.description}</div>
              </div>
              <div className="flex gap-2">
                <Button variant="destructive" size="sm" onClick={() => handleDelete(t)}>
                  Delete
                </Button>
              </div>
            </div>
          ))}
        </div>
      </div>

      <div className="flex justify-end">
        <Button variant="outline" onClick={() => onClose && onClose()}>Close</Button>
      </div>
    </div>
  );
}

export default ThemeManager;