UPDATE public.team_registrations
SET accepted = false
WHERE accepted IS NULL;

ALTER TABLE public.team_registrations
ALTER COLUMN accepted SET DEFAULT false,
ALTER COLUMN accepted SET NOT NULL;
