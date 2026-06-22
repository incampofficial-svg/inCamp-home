-- Create themes table to store tenant-scoped themes for problem statements
-- Run in Supabase SQL editor

CREATE TABLE IF NOT EXISTS themes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text,
  tenant_id uuid NOT NULL,
  created_at timestamptz DEFAULT now(),
  -- note: case-insensitive uniqueness is enforced via an index below
);

-- Prevent deleting a theme if any problem_statements reference it (by name)
CREATE OR REPLACE FUNCTION prevent_theme_delete()
RETURNS trigger AS $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM problem_statements ps
    WHERE ps.theme = OLD.name
      AND ps.tenant_id = OLD.tenant_id
    LIMIT 1
  ) THEN
    RAISE EXCEPTION 'Cannot delete theme "%", it is used by existing problem statements.', OLD.name;
  END IF;
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS themes_prevent_delete ON themes;
CREATE TRIGGER themes_prevent_delete
BEFORE DELETE ON themes
FOR EACH ROW EXECUTE FUNCTION prevent_theme_delete();

-- Create a case-insensitive unique index on (tenant_id, lower(name))
CREATE UNIQUE INDEX IF NOT EXISTS themes_tenant_name_lower_idx
  ON themes (tenant_id, lower(name));

-- Example: Insert default themes for a tenant (replace <TENANT_ID> with actual tenant id)
-- INSERT INTO themes (name, tenant_id) VALUES ('Academic', '<TENANT_ID>');
-- INSERT INTO themes (name, tenant_id) VALUES ('Non-Academic', '<TENANT_ID>');
-- INSERT INTO themes (name, tenant_id) VALUES ('Community Innovation', '<TENANT_ID>');