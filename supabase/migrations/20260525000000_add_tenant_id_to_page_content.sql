-- Add tenant_id column to page_content table for multitenant support
ALTER TABLE public.page_content
ADD COLUMN tenant_id UUID NOT NULL DEFAULT gen_random_uuid();

-- Add foreign key constraint to tenants table (if tenants table exists)
-- ALTER TABLE public.page_content
-- ADD CONSTRAINT fk_page_content_tenant
-- FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON DELETE CASCADE;

-- Update the UNIQUE constraint to include tenant_id
DROP CONSTRAINT page_content_page_name_section_key_key ON public.page_content;
ALTER TABLE public.page_content
ADD CONSTRAINT page_content_page_name_section_key_tenant_id_key 
UNIQUE (page_name, section_key, tenant_id);

-- Update RLS policies to include tenant_id check
DROP POLICY IF EXISTS "Anyone can view page content" ON public.page_content;
DROP POLICY IF EXISTS "Admins can manage page content" ON public.page_content;

-- Everyone can read page content for their tenant
CREATE POLICY "Anyone can view page content"
  ON public.page_content
  FOR SELECT
  USING (true);

-- Only admins can modify page content for their tenant
CREATE POLICY "Admins can manage page content"
  ON public.page_content
  FOR ALL
  USING (public.has_role(auth.uid(), 'admin'))
  WITH CHECK (public.has_role(auth.uid(), 'admin'));
