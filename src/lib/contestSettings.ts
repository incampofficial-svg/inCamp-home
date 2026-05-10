import { supabase } from "@/integrations/supabase/client";

export async function fetchProblemsUnlockAt(): Promise<Date | null> {
  const { data, error } = await (supabase as any)
    .from("contest_settings")
    .select("problems_unlock_at")
    .limit(1)
    .maybeSingle();

  if (error) {
    throw error;
  }

  if (!data?.problems_unlock_at) {
    return null;
  }

  return new Date(data.problems_unlock_at);
}
