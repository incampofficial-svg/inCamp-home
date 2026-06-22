--
-- PostgreSQL database dump
--

\restrict C0sGbBiBpEHfwbNsn2gx8RqxaGtY5dyIAubPO8BZtitELSuihOl8S6ceicDPVtU

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: pg_cron; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_cron WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION pg_cron; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_cron IS 'Job scheduler for PostgreSQL';


--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA supabase_migrations;


ALTER SCHEMA supabase_migrations OWNER TO postgres;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: app_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.app_role AS ENUM (
    'admin',
    'student',
    'new_value',
    'deptadmin',
    'department_admin',
    'institution_admin'
);


ALTER TYPE public.app_role OWNER TO postgres;

--
-- Name: user_query_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_query_status AS ENUM (
    'pending',
    'resolved'
);


ALTER TYPE public.user_query_status OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: archive_completed_events(interval); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.archive_completed_events(p_older_than interval DEFAULT '00:00:00'::interval) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  -- Move rows into archive
  WITH moved AS (
    INSERT INTO public.events_archive
    SELECT *
    FROM public.events
    WHERE (status = 'completed' OR end_at < now())
      AND (p_older_than IS NULL OR end_at < now() - p_older_than)
    RETURNING id
  )
  DELETE FROM public.events e
  USING moved m
  WHERE e.id = m.id;
END;
$$;


ALTER FUNCTION public.archive_completed_events(p_older_than interval) OWNER TO postgres;

--
-- Name: archive_past_events(interval); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.archive_past_events(p_older_than interval DEFAULT '00:00:00'::interval) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  WITH moved AS (
    INSERT INTO public.events_archive
    SELECT *
    FROM public.events
    WHERE event_date < now() - p_older_than
    RETURNING id
  )
  DELETE FROM public.events e
  USING moved m
  WHERE e.id = m.id;
END;
$$;


ALTER FUNCTION public.archive_past_events(p_older_than interval) OWNER TO postgres;

--
-- Name: can_access_problem_statement(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.can_access_problem_statement(ps_id uuid) RETURNS boolean
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  select exists (
    select 1
    from public.problem_statements ps
    where ps.id = ps_id
      and (
        public.is_admin_user()
        or ps.created_by = auth.uid()
        or (ps.department_id is not null and ps.department_id = public.current_department_id())
      )
  );
$$;


ALTER FUNCTION public.can_access_problem_statement(ps_id uuid) OWNER TO postgres;

--
-- Name: check_email_exists(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_email_exists(_email text) RETURNS boolean
    LANGUAGE sql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT EXISTS (SELECT 1 FROM public.profiles WHERE email = _email);
$$;


ALTER FUNCTION public.check_email_exists(_email text) OWNER TO postgres;

--
-- Name: check_team_name_exists(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_team_name_exists(team_name_input text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1
    FROM public.team_registrations
    WHERE LOWER(TRIM(team_name)) = LOWER(TRIM(team_name_input))
  );
END;
$$;


ALTER FUNCTION public.check_team_name_exists(team_name_input text) OWNER TO postgres;

--
-- Name: current_department_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.current_department_id() RETURNS uuid
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  select p.department_id from public.profiles p where p.id = auth.uid();
$$;


ALTER FUNCTION public.current_department_id() OWNER TO postgres;

--
-- Name: current_tenant_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.current_tenant_id() RETURNS uuid
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  select p.tenant_id
  from public.profiles p
  where p.id = auth.uid()
  limit 1
$$;


ALTER FUNCTION public.current_tenant_id() OWNER TO postgres;

--
-- Name: deactivate_past_events(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.deactivate_past_events() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE events
  SET is_active = false
  WHERE event_date < CURRENT_DATE
    AND is_active = true;
END;
$$;


ALTER FUNCTION public.deactivate_past_events() OWNER TO postgres;

--
-- Name: handle_new_team_registration(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_new_team_registration() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  UPDATE problem_statements
  SET curr_registrations = COALESCE(curr_registrations, 0) + 1
  WHERE problem_statement_id = NEW.problem_id;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.handle_new_team_registration() OWNER TO postgres;

--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
DECLARE
  v_tenant_id uuid;
BEGIN
  -- Safely parse tenant_id to avoid casting exceptions
  BEGIN
    IF NEW.raw_user_meta_data ->> 'tenant_id' IS NOT NULL AND NEW.raw_user_meta_data ->> 'tenant_id' <> '' THEN
      v_tenant_id := (NEW.raw_user_meta_data ->> 'tenant_id')::uuid;
    END IF;
  EXCEPTION WHEN OTHERS THEN
    v_tenant_id := NULL;
  END;

  -- Verify if the tenant actually exists in the tenants table to avoid foreign key violations
  IF v_tenant_id IS NOT NULL THEN
    IF NOT EXISTS (SELECT 1 FROM public.tenants WHERE id = v_tenant_id) THEN
      v_tenant_id := NULL;
    END IF;
  END IF;

  -- Insert or update profile (uses EXCEPTION block to be completely immune to constraint definition differences)
  BEGIN
    INSERT INTO public.profiles (id, name, email, role, department, year, tenant_id)
    VALUES (
      NEW.id,
      COALESCE(NEW.raw_user_meta_data ->> 'name', ''),
      NEW.email,
      'student',
      COALESCE(NULLIF(NEW.raw_user_meta_data ->> 'department', ''), 'Unknown'),
      COALESCE(NULLIF(NEW.raw_user_meta_data ->> 'year', ''), 'Unknown'),
      v_tenant_id
    );
  EXCEPTION WHEN UNIQUE_VIOLATION THEN
    UPDATE public.profiles
    SET
      name = COALESCE(NEW.raw_user_meta_data ->> 'name', ''),
      email = NEW.email,
      department = COALESCE(NULLIF(NEW.raw_user_meta_data ->> 'department', ''), 'Unknown'),
      year = COALESCE(NULLIF(NEW.raw_user_meta_data ->> 'year', ''), 'Unknown'),
      tenant_id = v_tenant_id
    WHERE id = NEW.id;
  END;

  -- Insert or update user role dynamically checking for tenant_id column existence and using EXCEPTION for unique constraints
  IF EXISTS (
    SELECT 1 
    FROM information_schema.columns 
    WHERE table_schema = 'public' 
      AND table_name = 'user_roles' 
      AND column_name = 'tenant_id'
  ) THEN
    BEGIN
      INSERT INTO public.user_roles (user_id, role, tenant_id)
      VALUES (NEW.id, 'student', v_tenant_id);
    EXCEPTION WHEN UNIQUE_VIOLATION THEN
      UPDATE public.user_roles 
      SET role = 'student', tenant_id = v_tenant_id 
      WHERE user_id = NEW.id;
    END;
  ELSE
    BEGIN
      INSERT INTO public.user_roles (user_id, role)
      VALUES (NEW.id, 'student');
    EXCEPTION WHEN UNIQUE_VIOLATION THEN
      UPDATE public.user_roles 
      SET role = 'student' 
      WHERE user_id = NEW.id;
    END;
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.handle_new_user() OWNER TO postgres;

--
-- Name: has_role(uuid, public.app_role); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.has_role(_user_id uuid, _role public.app_role) RETURNS boolean
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.user_roles
    WHERE user_id = _user_id
      AND role = _role
  )
$$;


ALTER FUNCTION public.has_role(_user_id uuid, _role public.app_role) OWNER TO postgres;

--
-- Name: has_tenant_role(public.app_role, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.has_tenant_role(_role public.app_role, _tenant_id uuid) RETURNS boolean
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  select exists (
    select 1
    from public.user_roles ur
    where ur.user_id = auth.uid()
      and ur.role = _role
      and ur.tenant_id = _tenant_id
  )
$$;


ALTER FUNCTION public.has_tenant_role(_role public.app_role, _tenant_id uuid) OWNER TO postgres;

--
-- Name: increment_curr_registrations(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.increment_curr_registrations(problem_uuid uuid) RETURNS void
    LANGUAGE sql
    AS $$
  UPDATE problem_statements
  SET curr_registrations = curr_registrations + 1
  WHERE id = problem_uuid;
$$;


ALTER FUNCTION public.increment_curr_registrations(problem_uuid uuid) OWNER TO postgres;

--
-- Name: is_admin_user(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.is_admin_user() RETURNS boolean
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  select coalesce(
    exists(
      select 1
      from public.profiles p
      where p.id = auth.uid()
        and p.role::text in ('admin','institution_admin')
    ),
    false
  );
$$;


ALTER FUNCTION public.is_admin_user() OWNER TO postgres;

--
-- Name: is_tenant_admin(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.is_tenant_admin(_tenant_id uuid) RETURNS boolean
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  select public.has_tenant_role('admin', _tenant_id)
      or public.has_tenant_role('institution_admin', _tenant_id)
$$;


ALTER FUNCTION public.is_tenant_admin(_tenant_id uuid) OWNER TO postgres;

--
-- Name: is_tenant_deptadmin(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.is_tenant_deptadmin(_tenant_id uuid) RETURNS boolean
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  select public.has_tenant_role('deptadmin', _tenant_id)
      or public.has_tenant_role('department_admin', _tenant_id)
$$;


ALTER FUNCTION public.is_tenant_deptadmin(_tenant_id uuid) OWNER TO postgres;

--
-- Name: prevent_theme_delete(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.prevent_theme_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM public.problem_statements ps
    WHERE ps.theme = OLD.name
      AND ps.tenant_id = OLD.tenant_id
    LIMIT 1
  ) THEN
    RAISE EXCEPTION 'Cannot delete theme "%", it is used by existing problem statements.', OLD.name;
  END IF;
  RETURN OLD;
END;
$$;


ALTER FUNCTION public.prevent_theme_delete() OWNER TO postgres;

--
-- Name: problem_statements_set_defaults(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.problem_statements_set_defaults() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  if new.created_by is null and auth.uid() is not null then
    new.created_by := auth.uid();
  end if;
  new.last_updated := now();
  return new;
end;
$$;


ALTER FUNCTION public.problem_statements_set_defaults() OWNER TO postgres;

--
-- Name: same_tenant(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.same_tenant(_tenant_id uuid) RETURNS boolean
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  select auth.uid() is not null
     and _tenant_id is not null
     and _tenant_id = public.current_tenant_id()
$$;


ALTER FUNCTION public.same_tenant(_tenant_id uuid) OWNER TO postgres;

--
-- Name: set_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  new.updated_at = now();
  return new;
end;
$$;


ALTER FUNCTION public.set_updated_at() OWNER TO postgres;

--
-- Name: sync_profile_role(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sync_profile_role() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
  update public.profiles
  set role = new.role
  where id = new.user_id;

  return new;
end;
$$;


ALTER FUNCTION public.sync_profile_role() OWNER TO postgres;

--
-- Name: sync_profiles_from_user_roles(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sync_profiles_from_user_roles() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _user_id uuid;
BEGIN
  -- Recursion guard
  IF current_setting('app.sync_in_progress', true) = 'user_roles_to_profiles' THEN
    RETURN NEW;
  END IF;

  _user_id := NEW.user_id;

  PERFORM
    set_config('app.sync_in_progress', 'user_roles_to_profiles', true);

  INSERT INTO public.profiles (id, tenant_id, role)
  VALUES (_user_id, NEW.tenant_id, NEW.role)
  ON CONFLICT (id)
  DO UPDATE
    SET tenant_id = EXCLUDED.tenant_id,
        role = EXCLUDED.role;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.sync_profiles_from_user_roles() OWNER TO postgres;

--
-- Name: sync_user_roles_from_profiles(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sync_user_roles_from_profiles() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _user_id uuid;
BEGIN
  -- Recursion guard: if we're already inside the other trigger, do nothing.
  IF current_setting('app.sync_in_progress', true) = 'profiles_to_user_roles' THEN
    RETURN NEW;
  END IF;

  _user_id := NEW.id;

  PERFORM
    set_config('app.sync_in_progress', 'profiles_to_user_roles', true);

  INSERT INTO public.user_roles (user_id, tenant_id, role)
  VALUES (_user_id, NEW.tenant_id, NEW.role)
  ON CONFLICT (user_id)
  DO UPDATE
    SET tenant_id = EXCLUDED.tenant_id,
        role = EXCLUDED.role;

  -- Keep the GUC value for this transaction (doesn't matter much after this).
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.sync_user_roles_from_profiles() OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
    -- Regclass of the table e.g. public.notes
    entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

    -- I, U, D, T: insert, update ...
    action realtime.action = (
        case wal ->> 'action'
            when 'I' then 'INSERT'
            when 'U' then 'UPDATE'
            when 'D' then 'DELETE'
            else 'ERROR'
        end
    );

    -- Is row level security enabled for the table
    is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

    subscriptions realtime.subscription[] = array_agg(subs)
        from
            realtime.subscription subs
        where
            subs.entity = entity_
            -- Filter by action early - only get subscriptions interested in this action
            -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
            and (subs.action_filter = '*' or subs.action_filter = action::text);

    -- Subscription vars
    working_role regrole;
    working_selected_columns text[];
    claimed_role regrole;
    claims jsonb;

    subscription_id uuid;
    subscription_has_access bool;
    visible_to_subscription_ids uuid[] = '{}';

    -- structured info for wal's columns
    columns realtime.wal_column[];
    -- previous identity values for update/delete
    old_columns realtime.wal_column[];

    error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

    -- Primary jsonb output for record
    output jsonb;

    -- Loop record for iterating unique roles (outer loop)
    role_record record;
    -- Loop record for iterating unique selected_columns within a role (inner loop)
    cols_record record;
    -- Subscription ids visible at the role level (before fanning out by selected_columns)
    visible_role_sub_ids uuid[] = '{}';

begin
    perform set_config('role', null, true);

    columns =
        array_agg(
            (
                x->>'name',
                x->>'type',
                x->>'typeoid',
                realtime.cast(
                    (x->'value') #>> '{}',
                    coalesce(
                        (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                        (x->>'type')::regtype
                    )
                ),
                (pks ->> 'name') is not null,
                true
            )::realtime.wal_column
        )
        from
            jsonb_array_elements(wal -> 'columns') x
            left join jsonb_array_elements(wal -> 'pk') pks
                on (x ->> 'name') = (pks ->> 'name');

    old_columns =
        array_agg(
            (
                x->>'name',
                x->>'type',
                x->>'typeoid',
                realtime.cast(
                    (x->'value') #>> '{}',
                    coalesce(
                        (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                        (x->>'type')::regtype
                    )
                ),
                (pks ->> 'name') is not null,
                true
            )::realtime.wal_column
        )
        from
            jsonb_array_elements(wal -> 'identity') x
            left join jsonb_array_elements(wal -> 'pk') pks
                on (x ->> 'name') = (pks ->> 'name');

    for role_record in
        select claims_role
        from (select distinct claims_role from unnest(subscriptions)) t
        order by claims_role::text
    loop
        working_role := role_record.claims_role;

        -- Update `is_selectable` for columns and old_columns (once per role)
        columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(columns) c;

        old_columns =
                array_agg(
                    (
                        c.name,
                        c.type_name,
                        c.type_oid,
                        c.value,
                        c.is_pkey,
                        pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                    )::realtime.wal_column
                )
                from
                    unnest(old_columns) c;

        if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
            -- Fan out 400 error per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where s.claims_role = working_role and (s.selected_columns is not distinct from working_selected_columns)),
                    array['Error 400: Bad Request, no primary key']
                )::realtime.wal_rls;
            end loop;

        -- The claims role does not have SELECT permission to the primary key of entity
        elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
            -- Fan out 401 error per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where s.claims_role = working_role and (s.selected_columns is not distinct from working_selected_columns)),
                    array['Error 401: Unauthorized']
                )::realtime.wal_rls;
            end loop;

        else
            -- Create the prepared statement (once per role)
            if is_rls_enabled and action <> 'DELETE' then
                if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                    deallocate walrus_rls_stmt;
                end if;
                execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
            end if;

            -- Collect all visible subscription IDs for this role (filter check + RLS check)
            visible_role_sub_ids = '{}';

            for subscription_id, claims in (
                    select
                        subs.subscription_id,
                        subs.claims
                    from
                        unnest(subscriptions) subs
                    where
                        subs.entity = entity_
                        and subs.claims_role = working_role
                        and (
                            realtime.is_visible_through_filters(columns, subs.filters)
                            or (
                              action = 'DELETE'
                              and realtime.is_visible_through_filters(old_columns, subs.filters)
                            )
                        )
            ) loop

                if not is_rls_enabled or action = 'DELETE' then
                    visible_role_sub_ids = visible_role_sub_ids || subscription_id;
                else
                    -- Check if RLS allows the role to see the record
                    perform
                        -- Trim leading and trailing quotes from working_role because set_config
                        -- doesn't recognize the role as valid if they are included
                        set_config('role', trim(both '"' from working_role::text), true),
                        set_config('request.jwt.claims', claims::text, true);

                    execute 'execute walrus_rls_stmt' into subscription_has_access;

                    if subscription_has_access then
                        visible_role_sub_ids = visible_role_sub_ids || subscription_id;
                    end if;
                end if;
            end loop;

            perform set_config('role', null, true);

            -- Inner loop: per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;

                output = jsonb_build_object(
                    'schema', wal ->> 'schema',
                    'table', wal ->> 'table',
                    'type', action,
                    'commit_timestamp', to_char(
                        ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                        'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
                    ),
                    'columns', (
                        select
                            jsonb_agg(
                                jsonb_build_object(
                                    'name', pa.attname,
                                    'type', pt.typname
                                )
                                order by pa.attnum asc
                            )
                        from
                            pg_attribute pa
                            join pg_type pt
                                on pa.atttypid = pt.oid
                            left join (
                                select unnest(conkey) as pkey_attnum
                                from pg_constraint
                                where conrelid = entity_ and contype = 'p'
                            ) pk on pk.pkey_attnum = pa.attnum
                        where
                            attrelid = entity_
                            and attnum > 0
                            and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
                            and (working_selected_columns is null or pa.attname = any(working_selected_columns) or pk.pkey_attnum is not null)
                    )
                )
                -- Add "record" key for insert and update
                || case
                    when action in ('INSERT', 'UPDATE') then
                        jsonb_build_object(
                            'record',
                            (
                                select
                                    jsonb_object_agg(
                                        -- if unchanged toast, get column name and value from old record
                                        coalesce((c).name, (oc).name),
                                        case
                                            when (c).name is null then (oc).value
                                            else (c).value
                                        end
                                    )
                                from
                                    unnest(columns) c
                                    full outer join unnest(old_columns) oc
                                        on (c).name = (oc).name
                                where
                                    coalesce((c).is_selectable, (oc).is_selectable)
                                    and (working_selected_columns is null or coalesce((c).name, (oc).name) = any(working_selected_columns) or coalesce((c).is_pkey, (oc).is_pkey))
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            )
                        )
                    else '{}'::jsonb
                end
                -- Add "old_record" key for update and delete
                || case
                    when action = 'UPDATE' then
                        jsonb_build_object(
                                'old_record',
                                (
                                    select jsonb_object_agg((c).name, (c).value)
                                    from unnest(old_columns) c
                                    where
                                        (c).is_selectable
                                        and (working_selected_columns is null or (c).name = any(working_selected_columns) or (c).is_pkey)
                                        and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                )
                            )
                    when action = 'DELETE' then
                        jsonb_build_object(
                            'old_record',
                            (
                                select jsonb_object_agg((c).name, (c).value)
                                from unnest(old_columns) c
                                where
                                    (c).is_selectable
                                    and (working_selected_columns is null or (c).name = any(working_selected_columns) or (c).is_pkey)
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                    and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                            )
                        )
                    else '{}'::jsonb
                end;

                -- Filter visible_role_sub_ids to those matching the current selected_columns group
                visible_to_subscription_ids = coalesce(
                    (
                        select array_agg(s.subscription_id)
                        from unnest(subscriptions) s
                        where s.claims_role = working_role
                          and (s.selected_columns is not distinct from working_selected_columns)
                          and s.subscription_id = any(visible_role_sub_ids)
                    ),
                    '{}'::uuid[]
                );

                return next (
                    output,
                    is_rls_enabled,
                    visible_to_subscription_ids,
                    case
                        when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                        else '{}'
                    end
                )::realtime.wal_rls;
            end loop;

        end if;
    end loop;

    perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS TABLE(wal jsonb, is_rls_enabled boolean, subscription_ids uuid[], errors text[], slot_changes_count bigint)
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
  WITH pub AS (
    SELECT
      concat_ws(
        ',',
        CASE WHEN bool_or(pubinsert) THEN 'insert' ELSE NULL END,
        CASE WHEN bool_or(pubupdate) THEN 'update' ELSE NULL END,
        CASE WHEN bool_or(pubdelete) THEN 'delete' ELSE NULL END
      ) AS w2j_actions,
      coalesce(
        string_agg(
          realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
          ','
        ) filter (WHERE ppt.tablename IS NOT NULL),
        ''
      ) AS w2j_add_tables
    FROM pg_publication pp
    LEFT JOIN pg_publication_tables ppt ON pp.pubname = ppt.pubname
    WHERE pp.pubname = publication
    GROUP BY pp.pubname
    LIMIT 1
  ),
  -- MATERIALIZED ensures pg_logical_slot_get_changes is called exactly once
  w2j AS MATERIALIZED (
    SELECT x.*, pub.w2j_add_tables
    FROM pub,
         pg_logical_slot_get_changes(
           slot_name, null, max_changes,
           'include-pk', 'true',
           'include-transaction', 'false',
           'include-timestamp', 'true',
           'include-type-oids', 'true',
           'format-version', '2',
           'actions', pub.w2j_actions,
           'add-tables', pub.w2j_add_tables
         ) x
  ),
  slot_count AS (
    SELECT count(*)::bigint AS cnt
    FROM w2j
    WHERE w2j.w2j_add_tables <> ''
  ),
  rls_filtered AS (
    SELECT xyz.wal, xyz.is_rls_enabled, xyz.subscription_ids, xyz.errors
    FROM w2j,
         realtime.apply_rls(
           wal := w2j.data::jsonb,
           max_record_bytes := max_record_bytes
         ) xyz(wal, is_rls_enabled, subscription_ids, errors)
    WHERE w2j.w2j_add_tables <> ''
      AND xyz.subscription_ids[1] IS NOT NULL
  )
  SELECT rf.wal, rf.is_rls_enabled, rf.subscription_ids, rf.errors, sc.cnt
  FROM rls_filtered rf, slot_count sc

  UNION ALL

  SELECT null, null, null, null, sc.cnt
  FROM slot_count sc
  WHERE NOT EXISTS (SELECT 1 FROM rls_filtered)
$$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
  SELECT
    realtime.wal2json_escape_identifier(nsp.nspname::text)
    || '.'
    || realtime.wal2json_escape_identifier(pc.relname::text)
  FROM pg_class pc
  JOIN pg_namespace nsp ON pc.relnamespace = nsp.oid
  WHERE pc.oid = entity
$$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      RAISE WARNING 'WarnSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: send_binary(bytea, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
BEGIN
  BEGIN
    generated_id := gen_random_uuid();

    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    INSERT INTO realtime.messages (id, binary_payload, event, topic, private, extension)
    VALUES (generated_id, payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      RAISE WARNING 'WarnSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
    col_names text[] = coalesce(
            array_agg(a.attname order by a.attnum),
            '{}'::text[]
        )
        from
            pg_catalog.pg_attribute a
        where
            a.attrelid = new.entity
            and a.attnum > 0
            and not a.attisdropped
            and pg_catalog.has_column_privilege(
                (new.claims ->> 'role'),
                a.attrelid,
                a.attnum,
                'SELECT'
            );
    filter realtime.user_defined_filter;
    col_type regtype;
    in_val jsonb;
    selected_col text;
begin
    for filter in select * from unnest(new.filters) loop
        if not filter.column_name = any(col_names) then
            raise exception 'invalid column for filter %', filter.column_name;
        end if;

        col_type = (
            select atttypid::regtype
            from pg_catalog.pg_attribute
            where attrelid = new.entity
                  and attname = filter.column_name
        );
        if col_type is null then
            raise exception 'failed to lookup type for column %', filter.column_name;
        end if;

        if filter.op = 'in'::realtime.equality_op then
            in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
            if coalesce(jsonb_array_length(in_val), 0) > 100 then
                raise exception 'too many values for `in` filter. Maximum 100';
            end if;
        else
            perform realtime.cast(filter.value, col_type);
        end if;
    end loop;

    if new.selected_columns is not null then
        for selected_col in select * from unnest(new.selected_columns) loop
            if not selected_col = any(col_names) then
                raise exception 'invalid column for select %', selected_col;
            end if;
        end loop;
    end if;

    new.filters = coalesce(
        array_agg(f order by f.column_name, f.op, f.value),
        '{}'
    ) from unnest(new.filters) f;

    new.selected_columns = (
        select array_agg(c order by c)
        from unnest(new.selected_columns) c
    );

    return new;
end;
$$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: wal2json_escape_identifier(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.wal2json_escape_identifier(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
  -- Prefix `\`, `,`, `.`, and any whitespace with `\`
  SELECT regexp_replace(name, '([\\,.[:space:]])', '\\\1', 'g')
$$;


ALTER FUNCTION realtime.wal2json_escape_identifier(name text) OWNER TO supabase_admin;

--
-- Name: allow_any_operation(text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_any_operation(expected_operations text[]) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT CASE
      WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
      ELSE raw_operation
    END AS current_operation
    FROM current_operation
  )
  SELECT EXISTS (
    SELECT 1
    FROM normalized n
    CROSS JOIN LATERAL unnest(expected_operations) AS expected_operation
    WHERE expected_operation IS NOT NULL
      AND expected_operation <> ''
      AND n.current_operation = CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END
  );
$$;


ALTER FUNCTION storage.allow_any_operation(expected_operations text[]) OWNER TO supabase_storage_admin;

--
-- Name: allow_only_operation(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.allow_only_operation(expected_operation text) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT
      CASE
        WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
        ELSE raw_operation
      END AS current_operation,
      CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END AS requested_operation
    FROM current_operation
  )
  SELECT CASE
    WHEN requested_operation IS NULL OR requested_operation = '' THEN FALSE
    ELSE COALESCE(current_operation = requested_operation, FALSE)
  END
  FROM normalized;
$$;


ALTER FUNCTION storage.allow_only_operation(expected_operation text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Get the last path segment (the actual filename)
    SELECT _parts[array_length(_parts, 1)] INTO _filename;
    -- Extract extension: reverse, split on '.', then reverse again
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


ALTER FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint)::bigint as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text, sort_order text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.protect_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.protect_delete() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach (unchanged)
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT path_tokens[$1] AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $2 || '%%'
                  AND bucket_id = $3
                  AND array_length(objects.path_tokens, 1) <> $1
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT path_tokens[$1] AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $2 || '%%'
               AND bucket_id = $3
               AND array_length(objects.path_tokens, 1) = $1
             ORDER BY %I %s)
            LIMIT $4 OFFSET $5
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := split_part(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter), v_delimiter, levels);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := split_part(v_current.name, v_delimiter, levels);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    IF p_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        p_sort_column,
        v_cursor_op,
        p_sort_column,
        p_sort_order,
        p_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.custom_oauth_providers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    provider_type text NOT NULL,
    identifier text NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret text NOT NULL,
    acceptable_client_ids text[] DEFAULT '{}'::text[] NOT NULL,
    scopes text[] DEFAULT '{}'::text[] NOT NULL,
    pkce_enabled boolean DEFAULT true NOT NULL,
    attribute_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    authorization_params jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email_optional boolean DEFAULT false NOT NULL,
    issuer text,
    discovery_url text,
    skip_nonce_check boolean DEFAULT false NOT NULL,
    cached_discovery jsonb,
    discovery_cached_at timestamp with time zone,
    authorization_url text,
    token_url text,
    userinfo_url text,
    jwks_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT custom_oauth_providers_authorization_url_https CHECK (((authorization_url IS NULL) OR (authorization_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_authorization_url_length CHECK (((authorization_url IS NULL) OR (char_length(authorization_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_client_id_length CHECK (((char_length(client_id) >= 1) AND (char_length(client_id) <= 512))),
    CONSTRAINT custom_oauth_providers_discovery_url_length CHECK (((discovery_url IS NULL) OR (char_length(discovery_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_identifier_format CHECK ((identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text)),
    CONSTRAINT custom_oauth_providers_issuer_length CHECK (((issuer IS NULL) OR ((char_length(issuer) >= 1) AND (char_length(issuer) <= 2048)))),
    CONSTRAINT custom_oauth_providers_jwks_uri_https CHECK (((jwks_uri IS NULL) OR (jwks_uri ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_jwks_uri_length CHECK (((jwks_uri IS NULL) OR (char_length(jwks_uri) <= 2048))),
    CONSTRAINT custom_oauth_providers_name_length CHECK (((char_length(name) >= 1) AND (char_length(name) <= 100))),
    CONSTRAINT custom_oauth_providers_oauth2_requires_endpoints CHECK (((provider_type <> 'oauth2'::text) OR ((authorization_url IS NOT NULL) AND (token_url IS NOT NULL) AND (userinfo_url IS NOT NULL)))),
    CONSTRAINT custom_oauth_providers_oidc_discovery_url_https CHECK (((provider_type <> 'oidc'::text) OR (discovery_url IS NULL) OR (discovery_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_issuer_https CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NULL) OR (issuer ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_requires_issuer CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NOT NULL))),
    CONSTRAINT custom_oauth_providers_provider_type_check CHECK ((provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text]))),
    CONSTRAINT custom_oauth_providers_token_url_https CHECK (((token_url IS NULL) OR (token_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_token_url_length CHECK (((token_url IS NULL) OR (char_length(token_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_userinfo_url_https CHECK (((userinfo_url IS NULL) OR (userinfo_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_userinfo_url_length CHECK (((userinfo_url IS NULL) OR (char_length(userinfo_url) <= 2048)))
);


ALTER TABLE auth.custom_oauth_providers OWNER TO supabase_auth_admin;

--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: webauthn_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_challenges (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    challenge_type text NOT NULL,
    session_data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    CONSTRAINT webauthn_challenges_challenge_type_check CHECK ((challenge_type = ANY (ARRAY['signup'::text, 'registration'::text, 'authentication'::text])))
);


ALTER TABLE auth.webauthn_challenges OWNER TO supabase_auth_admin;

--
-- Name: webauthn_credentials; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.webauthn_credentials (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    credential_id bytea NOT NULL,
    public_key bytea NOT NULL,
    attestation_type text DEFAULT ''::text NOT NULL,
    aaguid uuid,
    sign_count bigint DEFAULT 0 NOT NULL,
    transports jsonb DEFAULT '[]'::jsonb NOT NULL,
    backup_eligible boolean DEFAULT false NOT NULL,
    backed_up boolean DEFAULT false NOT NULL,
    friendly_name text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used_at timestamp with time zone
);


ALTER TABLE auth.webauthn_credentials OWNER TO supabase_auth_admin;

--
-- Name: contest_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contest_settings (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    problems_unlock_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    department_unlocks_at timestamp with time zone,
    department_closes_at timestamp with time zone,
    tenant_id uuid,
    CONSTRAINT contest_settings_department_window_chk CHECK ((department_closes_at > department_unlocks_at))
);


ALTER TABLE public.contest_settings OWNER TO postgres;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    code text,
    location text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: event_registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_registrations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    event_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.event_registrations OWNER TO postgres;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    event_date timestamp with time zone NOT NULL,
    location text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_active boolean DEFAULT true,
    event_type text,
    mode text,
    image_url text,
    organizer_name text,
    organizer_contact text,
    registration_deadline timestamp with time zone,
    max_participants integer,
    problem_statement_deadline timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    registration_start_date timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL,
    has_problem_statement boolean DEFAULT false,
    resource_person text,
    tenant_id uuid NOT NULL,
    registration_link text
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_archive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events_archive (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    event_date timestamp with time zone NOT NULL,
    location text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_active boolean DEFAULT true,
    event_type text,
    mode text,
    image_url text,
    organizer_name text,
    organizer_contact text,
    registration_deadline timestamp with time zone,
    max_participants integer,
    problem_statement_deadline timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text),
    registration_start_date timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL,
    has_problem_statement boolean DEFAULT false,
    resource_person text,
    tenant_id uuid NOT NULL,
    registration_link text,
    archived_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.events_archive OWNER TO postgres;

--
-- Name: page_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.page_content (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    page_name text NOT NULL,
    section_key text NOT NULL,
    content jsonb DEFAULT '{}'::jsonb NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    tenant_id uuid NOT NULL
);


ALTER TABLE public.page_content OWNER TO postgres;

--
-- Name: problem_statement_alerts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_statement_alerts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    recipient_user_id uuid NOT NULL,
    problem_statement_id uuid,
    type text NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    priority text DEFAULT 'medium'::text NOT NULL,
    is_read boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.problem_statement_alerts OWNER TO postgres;

--
-- Name: problem_statement_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_statement_attachments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    problem_statement_id uuid NOT NULL,
    uploaded_by uuid,
    file_name text NOT NULL,
    object_path text NOT NULL,
    mime_type text,
    file_size bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.problem_statement_attachments OWNER TO postgres;

--
-- Name: problem_statement_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_statement_messages (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    problem_statement_id uuid NOT NULL,
    sender_id uuid,
    sender_role text,
    recipient_role text,
    content text NOT NULL,
    is_read boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.problem_statement_messages OWNER TO postgres;

--
-- Name: problem_statement_remarks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_statement_remarks (
    id bigint NOT NULL,
    problem_statement_id uuid NOT NULL,
    remark text NOT NULL,
    author_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.problem_statement_remarks OWNER TO postgres;

--
-- Name: problem_statement_remarks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_statement_remarks ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.problem_statement_remarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: problem_statement_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_statement_reviews (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    problem_statement_id uuid NOT NULL,
    reviewer_id uuid,
    review_note text NOT NULL,
    recommended_status text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.problem_statement_reviews OWNER TO postgres;

--
-- Name: problem_statements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problem_statements (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    problem_statement_id text NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    category text NOT NULL,
    theme text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    detailed_description text,
    department text,
    status text DEFAULT 'draft'::text,
    created_by uuid,
    department_id uuid,
    faculty_owner text,
    assigned_spoc text,
    submission_batch_id uuid,
    submitted_at timestamp with time zone,
    approved_at timestamp with time zone,
    revision_note text,
    expected_outcomes text,
    resource_requirements text,
    timeline_milestones text,
    budget_estimation text,
    last_updated timestamp with time zone DEFAULT now() NOT NULL,
    event_id uuid,
    admin_remark text,
    max_registrations integer,
    curr_registrations integer DEFAULT 0 NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.problem_statements OWNER TO postgres;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    name text,
    email text,
    role public.app_role DEFAULT 'student'::public.app_role NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    phone text,
    avatar_url text,
    faculty_id text,
    department_id uuid,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    department text DEFAULT 'Unknown'::text NOT NULL,
    year text DEFAULT 'Unknown'::text NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    description text,
    file_url text,
    file_type text,
    section_key text NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.resources OWNER TO postgres;

--
-- Name: submission_batch_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.submission_batch_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    batch_id uuid NOT NULL,
    problem_statement_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.submission_batch_items OWNER TO postgres;

--
-- Name: submission_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.submission_batches (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    department_id uuid,
    submitted_by uuid,
    status text DEFAULT 'submitted'::text NOT NULL,
    cover_note text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    submitted_at timestamp with time zone DEFAULT now() NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.submission_batches OWNER TO postgres;

--
-- Name: team_registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_registrations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    team_name text NOT NULL,
    problem_id text NOT NULL,
    member1_name text NOT NULL,
    member1_roll text NOT NULL,
    member2_name text,
    member2_roll text,
    member3_name text,
    member3_roll text,
    member4_name text,
    member4_roll text,
    member1_year text NOT NULL,
    member1_department text NOT NULL,
    member1_phone text NOT NULL,
    member1_email text NOT NULL,
    document_url text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    document_filename text,
    member3_year text,
    member3_department text,
    member3_phone text,
    member3_email text,
    member4_year text,
    member4_department text,
    member4_phone text,
    member4_email text,
    member2_year text NOT NULL,
    member2_department text NOT NULL,
    member2_phone text NOT NULL,
    member2_email text NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.team_registrations OWNER TO postgres;

--
-- Name: tenants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenants (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tenants OWNER TO postgres;

--
-- Name: themes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    tenant_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.themes OWNER TO postgres;

--
-- Name: user_queries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_queries (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    query_text text NOT NULL,
    user_id uuid,
    user_email text,
    user_name text,
    status public.user_query_status DEFAULT 'pending'::public.user_query_status NOT NULL,
    resolved_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.user_queries OWNER TO postgres;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    role public.app_role NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_2026_02_12; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_02_12 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea
);


ALTER TABLE realtime.messages_2026_02_12 OWNER TO supabase_admin;

--
-- Name: messages_2026_02_13; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_02_13 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea
);


ALTER TABLE realtime.messages_2026_02_13 OWNER TO supabase_admin;

--
-- Name: messages_2026_02_14; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_02_14 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea
);


ALTER TABLE realtime.messages_2026_02_14 OWNER TO supabase_admin;

--
-- Name: messages_2026_02_15; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_02_15 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea
);


ALTER TABLE realtime.messages_2026_02_15 OWNER TO supabase_admin;

--
-- Name: messages_2026_02_16; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_02_16 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea
);


ALTER TABLE realtime.messages_2026_02_16 OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    selected_columns text[],
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb,
    metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.schema_migrations (
    version text NOT NULL,
    statements text[],
    name text
);


ALTER TABLE supabase_migrations.schema_migrations OWNER TO postgres;

--
-- Name: messages_2026_02_12; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_02_12 FOR VALUES FROM ('2026-02-12 00:00:00') TO ('2026-02-13 00:00:00');


--
-- Name: messages_2026_02_13; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_02_13 FOR VALUES FROM ('2026-02-13 00:00:00') TO ('2026-02-14 00:00:00');


--
-- Name: messages_2026_02_14; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_02_14 FOR VALUES FROM ('2026-02-14 00:00:00') TO ('2026-02-15 00:00:00');


--
-- Name: messages_2026_02_15; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_02_15 FOR VALUES FROM ('2026-02-15 00:00:00') TO ('2026-02-16 00:00:00');


--
-- Name: messages_2026_02_16; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_02_16 FOR VALUES FROM ('2026-02-16 00:00:00') TO ('2026-02-17 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
ea5561b5-6918-4212-83d9-5e48dec790ce	ea5561b5-6918-4212-83d9-5e48dec790ce	{"sub": "ea5561b5-6918-4212-83d9-5e48dec790ce", "name": "Jay", "email": "23r11a0544@gcet.edu.in", "email_verified": true, "phone_verified": false}	email	2026-02-10 15:03:19.44782+00	2026-02-10 15:03:19.447887+00	2026-02-10 15:03:19.447887+00	c6b92ee3-1bae-4a93-9648-b5de4017e93b
b280f8c8-b05a-4237-b606-802420092eb1	b280f8c8-b05a-4237-b606-802420092eb1	{"sub": "b280f8c8-b05a-4237-b606-802420092eb1", "name": "advika", "email": "23r11a67c7@gcet.edu.in", "email_verified": true, "phone_verified": false}	email	2026-02-14 05:26:30.892999+00	2026-02-14 05:26:30.893057+00	2026-02-14 05:26:30.893057+00	eaa718e4-7d23-4721-94eb-fe45f5ec569e
ec79d798-6f6f-4549-8d79-edd15870b43b	ec79d798-6f6f-4549-8d79-edd15870b43b	{"sub": "ec79d798-6f6f-4549-8d79-edd15870b43b", "name": "lilly", "email": "23r11a0566@gcet.edu.in", "email_verified": false, "phone_verified": false}	email	2026-02-15 18:58:18.476636+00	2026-02-15 18:58:18.476689+00	2026-02-15 18:58:18.476689+00	56988b0f-a9e4-4f8c-9610-f980d90ce66b
b84fe995-c654-433b-949a-5d14b471481b	b84fe995-c654-433b-949a-5d14b471481b	{"sub": "b84fe995-c654-433b-949a-5d14b471481b", "name": "rishik", "email": "23r11a0546@gcet.edu.in", "email_verified": true, "phone_verified": false}	email	2026-03-03 08:25:15.230711+00	2026-03-03 08:25:15.230768+00	2026-03-03 08:25:15.230768+00	5029da16-8ddb-450f-b140-9b637ef239b9
d1645cf0-5274-43f6-94d5-f0db4c6dcabf	d1645cf0-5274-43f6-94d5-f0db4c6dcabf	{"sub": "d1645cf0-5274-43f6-94d5-f0db4c6dcabf", "name": "abhiram", "email": "23r11a0511@gcet.edu.in", "email_verified": true, "phone_verified": false}	email	2026-03-03 08:24:42.177145+00	2026-03-03 08:24:42.179078+00	2026-03-03 08:24:42.179078+00	448c6db4-f543-4d54-978e-9be93d790940
99abb06b-7974-45ae-887a-9a87e6ec9c36	99abb06b-7974-45ae-887a-9a87e6ec9c36	{"sub": "99abb06b-7974-45ae-887a-9a87e6ec9c36", "name": "Rishik", "email": "23r11a0512@gcet.edu.in", "email_verified": true, "phone_verified": false}	email	2026-03-06 16:05:35.109566+00	2026-03-06 16:05:35.109627+00	2026-03-06 16:05:35.109627+00	09373110-8029-47fc-a873-bc95e29770cf
595d5afb-c1f6-47a7-b92a-96519c1fc36f	595d5afb-c1f6-47a7-b92a-96519c1fc36f	{"sub": "595d5afb-c1f6-47a7-b92a-96519c1fc36f", "name": "Vaishnavi", "email": "23r11a0513@gcet.edu.in", "email_verified": false, "phone_verified": false}	email	2026-03-06 16:16:51.319081+00	2026-03-06 16:16:51.319127+00	2026-03-06 16:16:51.319127+00	92f81471-1fbc-448a-b910-ece477355755
f6601227-10dc-4bb5-9be0-a48df646882c	f6601227-10dc-4bb5-9be0-a48df646882c	{"sub": "f6601227-10dc-4bb5-9be0-a48df646882c", "name": "Shivani", "email": "23r11a0505@gcet.edu.in", "email_verified": true, "phone_verified": false}	email	2026-03-10 04:36:59.193759+00	2026-03-10 04:36:59.193807+00	2026-03-10 04:36:59.193807+00	0781a1bb-d9b3-4f4a-a3c7-c68b3bfea323
f6e82f04-701a-4e83-84a9-b311eaed6db2	f6e82f04-701a-4e83-84a9-b311eaed6db2	{"sub": "f6e82f04-701a-4e83-84a9-b311eaed6db2", "name": "Abhaya", "year": "4", "email": "21r11a05c0@gcet.edu.in", "department": "CSE", "email_verified": true, "phone_verified": false}	email	2026-04-16 16:03:43.336261+00	2026-04-16 16:03:43.336313+00	2026-04-16 16:03:43.336313+00	0f3cc657-73a6-4a95-8c9f-5e95493ea38a
2e83ba6a-9778-4e84-80b2-168409debced	2e83ba6a-9778-4e84-80b2-168409debced	{"sub": "2e83ba6a-9778-4e84-80b2-168409debced", "name": "Advika", "year": "4", "email": "23r11a0515@gcet.edu.in", "tenant_id": "0ee52668-ea70-4740-9f7b-b15ba5535254", "department": "CSE", "email_verified": true, "phone_verified": false}	email	2026-05-29 05:55:01.09317+00	2026-05-29 05:55:01.093239+00	2026-05-29 05:55:01.093239+00	d6ba2042-04eb-41ce-9184-adcd89740e75
bc00594c-8776-4bef-9d32-cf6176f89f81	bc00594c-8776-4bef-9d32-cf6176f89f81	{"sub": "bc00594c-8776-4bef-9d32-cf6176f89f81", "name": "Vivek Vardhan", "year": "4", "email": "23r11a0531@gcet.edu.in", "tenant_id": "0ee52668-ea70-4740-9f7b-b15ba5535254", "department": "CSE", "email_verified": true, "phone_verified": false}	email	2026-05-29 07:15:19.787248+00	2026-05-29 07:15:19.787308+00	2026-05-29 07:15:19.787308+00	a57e11e8-12e9-47e1-8c4c-bf94ea4bce8d
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
661ab255-7150-4bb1-af9c-3c55d35128a7	2026-05-28 08:59:22.487088+00	2026-05-28 08:59:22.487088+00	password	8f6d8fbc-9f64-4976-8f7a-0abae9d56e2a
4efc29ef-893a-41d5-8bc4-5639ef427ee9	2026-05-28 09:25:20.044047+00	2026-05-28 09:25:20.044047+00	password	46bd205a-33b4-49ba-b5d6-33ff9595d963
d967d768-9611-4b9d-adcc-0af86ad909bb	2026-05-28 09:37:26.604093+00	2026-05-28 09:37:26.604093+00	password	8b3af0a1-c912-47d9-9c85-7326f9a07c22
e5bf4bab-8481-4261-891a-11e20b5b233b	2026-06-18 06:36:49.951043+00	2026-06-18 06:36:49.951043+00	password	5b484c6c-9e3e-4d6b-8fe2-120a9c515457
b8591ffa-b91f-4eb3-b644-075e68adeb47	2026-05-28 07:06:25.316105+00	2026-05-28 07:06:25.316105+00	password	62620a42-b167-4def-8b1b-7ebea5dd9178
b5e61792-8088-40c1-bdd9-860c9c62cc8b	2026-05-29 06:37:50.369552+00	2026-05-29 06:37:50.369552+00	password	e013f39a-aa51-4edb-9272-d3e361ecaf19
8603c917-e253-4e42-bd8d-a8be14d40f94	2026-05-28 07:12:18.123713+00	2026-05-28 07:12:18.123713+00	password	15be8e87-1ad5-47fc-8ff2-fb2cbb893c26
b61a4643-ec2e-40b8-9e12-2ffebe17b920	2026-05-29 06:42:34.800329+00	2026-05-29 06:42:34.800329+00	password	25458360-0c63-488e-a201-34a4cb0390fb
0ece92fa-53df-42db-a509-8b2b01ce3321	2026-05-29 06:43:01.742993+00	2026-05-29 06:43:01.742993+00	password	cb996039-e6c8-449d-b941-b829e267799e
3ce6c222-95d3-46c9-8dc5-974ba870abfb	2026-05-29 06:44:50.263804+00	2026-05-29 06:44:50.263804+00	password	442f7ab9-1488-4f3f-9a1f-3c0ced36d7ad
8d0c8278-d6b4-4290-b0ed-080c07d65a13	2026-04-16 16:04:23.942872+00	2026-04-16 16:04:23.942872+00	otp	ca5d6c54-1dc0-4eeb-97d6-2bbccd9c53fb
a76f5fed-6a03-40d9-b2d7-2acf895ce7d8	2026-05-29 06:45:36.330691+00	2026-05-29 06:45:36.330691+00	password	17185761-6fa9-4396-94a8-a8e523dd897a
b4a49cb0-0b5a-4295-a106-acaf14602e9b	2026-05-29 06:47:35.675982+00	2026-05-29 06:47:35.675982+00	password	0d28d493-7e91-4654-8143-9d7876f26691
4b4a996f-9979-44e4-8b0c-fe1e62464b30	2026-03-10 04:37:16.070448+00	2026-03-10 04:37:16.070448+00	otp	5473cf53-8e25-4ffe-be15-d59b5ba66494
b71c0817-a47b-4c03-8ed3-4d0c8cfd8bad	2026-05-29 07:32:40.951836+00	2026-05-29 07:32:40.951836+00	password	95abc842-6d80-4bb8-a770-775bdd595467
5678ad3d-a932-4b82-80e2-0b04316326a8	2026-06-06 07:41:27.294942+00	2026-06-06 07:41:27.294942+00	password	7c3209e6-7130-408f-889f-e267e873b383
7e579c1b-3573-4b6e-9034-2c4ac1a526d6	2026-06-06 07:47:55.944893+00	2026-06-06 07:47:55.944893+00	password	21510e35-2b9a-4b81-9d2e-bd10e0a56d58
6f5852aa-158f-481d-a703-ce92c4617207	2026-06-06 08:10:41.306841+00	2026-06-06 08:10:41.306841+00	password	6f858135-dc5d-4cfb-ab11-aff81bf38233
2a46e00f-083f-4fc9-aa1d-9550404b6ca4	2026-06-14 12:38:51.205377+00	2026-06-14 12:38:51.205377+00	password	af348922-c767-4d18-a116-8b8400443774
9869946c-8777-4c38-9bf8-6060915720dd	2026-06-14 13:59:50.350829+00	2026-06-14 13:59:50.350829+00	password	53fa9f69-4e7b-46fb-8ebe-b52bd337222f
e62301df-9038-444d-95a9-a66e1c30bfbd	2026-06-16 05:47:37.790026+00	2026-06-16 05:47:37.790026+00	password	ec8b889c-168e-4270-a36c-36cd69190f35
466e150b-5557-4534-bb42-71ea04aba575	2026-06-16 06:53:09.42132+00	2026-06-16 06:53:09.42132+00	password	c5f6aeb6-76e6-457c-a0e6-6a6c11b98506
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
2190ec43-1f67-48b2-95af-55765a9677b8	ec79d798-6f6f-4549-8d79-edd15870b43b	confirmation_token	59c5025a182016539fc625b9dcc945b992f9334734da09d9d8a757e2	23r11a0566@gcet.edu.in	2026-02-15 18:58:22.01992	2026-02-15 18:58:22.01992
67782db6-33fc-494c-84c9-b12e665c7294	595d5afb-c1f6-47a7-b92a-96519c1fc36f	confirmation_token	a10c1bac50098bc6c2f76bdff270755b9b91c3f6918a39cf378482d5	23r11a0513@gcet.edu.in	2026-03-06 16:16:54.30764	2026-03-06 16:16:54.30764
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	866	e3umr2njgmmd	b84fe995-c654-433b-949a-5d14b471481b	t	2026-05-28 07:06:25.314884+00	2026-05-28 08:52:15.939426+00	\N	b8591ffa-b91f-4eb3-b644-075e68adeb47
00000000-0000-0000-0000-000000000000	890	ug6dt2jxqcsr	b84fe995-c654-433b-949a-5d14b471481b	f	2026-05-28 08:52:15.950196+00	2026-05-28 08:52:15.950196+00	e3umr2njgmmd	b8591ffa-b91f-4eb3-b644-075e68adeb47
00000000-0000-0000-0000-000000000000	1077	xqcx3usltau2	bc00594c-8776-4bef-9d32-cf6176f89f81	f	2026-06-06 07:47:55.930255+00	2026-06-06 07:47:55.930255+00	\N	7e579c1b-3573-4b6e-9034-2c4ac1a526d6
00000000-0000-0000-0000-000000000000	1081	2lthhoikbb5g	ea5561b5-6918-4212-83d9-5e48dec790ce	f	2026-06-14 12:38:51.197844+00	2026-06-14 12:38:51.197844+00	\N	2a46e00f-083f-4fc9-aa1d-9550404b6ca4
00000000-0000-0000-0000-000000000000	897	rlbpknkdzbbb	b84fe995-c654-433b-949a-5d14b471481b	f	2026-05-28 09:37:26.602955+00	2026-05-28 09:37:26.602955+00	\N	d967d768-9611-4b9d-adcc-0af86ad909bb
00000000-0000-0000-0000-000000000000	577	ofoelurvgmba	f6601227-10dc-4bb5-9be0-a48df646882c	f	2026-03-10 04:37:16.05829+00	2026-03-10 04:37:16.05829+00	\N	4b4a996f-9979-44e4-8b0c-fe1e62464b30
00000000-0000-0000-0000-000000000000	891	nha22hfv57de	ea5561b5-6918-4212-83d9-5e48dec790ce	t	2026-05-28 08:59:22.471861+00	2026-05-28 11:05:50.062019+00	\N	661ab255-7150-4bb1-af9c-3c55d35128a7
00000000-0000-0000-0000-000000000000	1089	qehn76gkgm3s	bc00594c-8776-4bef-9d32-cf6176f89f81	f	2026-06-16 05:47:37.787076+00	2026-06-16 05:47:37.787076+00	\N	e62301df-9038-444d-95a9-a66e1c30bfbd
00000000-0000-0000-0000-000000000000	900	6qj5on5foxem	ea5561b5-6918-4212-83d9-5e48dec790ce	t	2026-05-28 11:05:50.099272+00	2026-05-28 12:04:21.101245+00	nha22hfv57de	661ab255-7150-4bb1-af9c-3c55d35128a7
00000000-0000-0000-0000-000000000000	901	7qgb2mjy5zrq	ea5561b5-6918-4212-83d9-5e48dec790ce	t	2026-05-28 12:04:21.117998+00	2026-05-28 13:05:09.440816+00	6qj5on5foxem	661ab255-7150-4bb1-af9c-3c55d35128a7
00000000-0000-0000-0000-000000000000	871	bujalc6ms5eu	f6601227-10dc-4bb5-9be0-a48df646882c	f	2026-05-28 07:12:18.121639+00	2026-05-28 07:12:18.121639+00	\N	8603c917-e253-4e42-bd8d-a8be14d40f94
00000000-0000-0000-0000-000000000000	704	ei66b5rirvtx	f6e82f04-701a-4e83-84a9-b311eaed6db2	f	2026-04-16 16:04:23.922313+00	2026-04-16 16:04:23.922313+00	\N	8d0c8278-d6b4-4290-b0ed-080c07d65a13
00000000-0000-0000-0000-000000000000	902	ujksn5mit24e	ea5561b5-6918-4212-83d9-5e48dec790ce	t	2026-05-28 13:05:09.4662+00	2026-05-28 14:47:16.834484+00	7qgb2mjy5zrq	661ab255-7150-4bb1-af9c-3c55d35128a7
00000000-0000-0000-0000-000000000000	903	n2xtac6puhtu	ea5561b5-6918-4212-83d9-5e48dec790ce	f	2026-05-28 14:47:16.859634+00	2026-05-28 14:47:16.859634+00	ujksn5mit24e	661ab255-7150-4bb1-af9c-3c55d35128a7
00000000-0000-0000-0000-000000000000	893	2z3huwkrnyce	ea5561b5-6918-4212-83d9-5e48dec790ce	t	2026-05-28 09:25:20.031529+00	2026-05-28 14:47:42.496002+00	\N	4efc29ef-893a-41d5-8bc4-5639ef427ee9
00000000-0000-0000-0000-000000000000	904	yz5vggixnidx	ea5561b5-6918-4212-83d9-5e48dec790ce	f	2026-05-28 14:47:42.496352+00	2026-05-28 14:47:42.496352+00	2z3huwkrnyce	4efc29ef-893a-41d5-8bc4-5639ef427ee9
00000000-0000-0000-0000-000000000000	923	aquf7cdzvufy	b84fe995-c654-433b-949a-5d14b471481b	f	2026-05-29 06:37:50.368365+00	2026-05-29 06:37:50.368365+00	\N	b5e61792-8088-40c1-bdd9-860c9c62cc8b
00000000-0000-0000-0000-000000000000	972	nqm3ub334pmu	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:01.735083+00	2026-05-29 06:43:02.044359+00	\N	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	1045	dmw43uipkj33	2e83ba6a-9778-4e84-80b2-168409debced	f	2026-05-29 06:47:35.674096+00	2026-05-29 06:47:35.674096+00	\N	b4a49cb0-0b5a-4295-a106-acaf14602e9b
00000000-0000-0000-0000-000000000000	973	ics3i6js4ls4	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:02.046417+00	2026-05-29 06:43:02.642345+00	nqm3ub334pmu	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	1079	pgvuuekqxfal	f6601227-10dc-4bb5-9be0-a48df646882c	f	2026-06-06 08:10:41.305486+00	2026-06-06 08:10:41.305486+00	\N	6f5852aa-158f-481d-a703-ce92c4617207
00000000-0000-0000-0000-000000000000	1086	w55qpdgx3kye	bc00594c-8776-4bef-9d32-cf6176f89f81	f	2026-06-15 13:21:03.938049+00	2026-06-15 13:21:03.938049+00	cdmgh5foznf7	9869946c-8777-4c38-9bf8-6060915720dd
00000000-0000-0000-0000-000000000000	1090	7q6a6lrf2dn3	bc00594c-8776-4bef-9d32-cf6176f89f81	f	2026-06-16 06:53:09.384852+00	2026-06-16 06:53:09.384852+00	\N	466e150b-5557-4534-bb42-71ea04aba575
00000000-0000-0000-0000-000000000000	974	lsash653uoyn	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:02.64293+00	2026-05-29 06:43:02.929343+00	ics3i6js4ls4	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	1096	mhcvzydnmdm2	bc00594c-8776-4bef-9d32-cf6176f89f81	f	2026-06-18 06:36:49.936907+00	2026-06-18 06:36:49.936907+00	\N	e5bf4bab-8481-4261-891a-11e20b5b233b
00000000-0000-0000-0000-000000000000	975	bfb3zxup3s5m	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:02.929799+00	2026-05-29 06:43:03.214898+00	lsash653uoyn	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	976	ixk74vd3qrk7	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:03.215823+00	2026-05-29 06:43:03.504066+00	bfb3zxup3s5m	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	964	m3twdtdgiokz	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:42:34.799118+00	2026-05-29 06:42:35.090563+00	\N	b61a4643-ec2e-40b8-9e12-2ffebe17b920
00000000-0000-0000-0000-000000000000	965	3ycmpvuur3cy	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:42:35.091783+00	2026-05-29 06:42:35.658734+00	m3twdtdgiokz	b61a4643-ec2e-40b8-9e12-2ffebe17b920
00000000-0000-0000-0000-000000000000	977	kwqdskkdx45n	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:03.505494+00	2026-05-29 06:43:03.795726+00	ixk74vd3qrk7	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	966	nbb2l3cvx7vd	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:42:35.659155+00	2026-05-29 06:42:35.939472+00	3ycmpvuur3cy	b61a4643-ec2e-40b8-9e12-2ffebe17b920
00000000-0000-0000-0000-000000000000	967	ielaossqnb5p	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:42:35.940265+00	2026-05-29 06:42:36.253623+00	nbb2l3cvx7vd	b61a4643-ec2e-40b8-9e12-2ffebe17b920
00000000-0000-0000-0000-000000000000	978	llwpxdbhfcb3	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:03.796483+00	2026-05-29 06:43:04.085185+00	kwqdskkdx45n	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	968	nvutzjoiiyuj	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:42:36.254249+00	2026-05-29 06:42:36.541522+00	ielaossqnb5p	b61a4643-ec2e-40b8-9e12-2ffebe17b920
00000000-0000-0000-0000-000000000000	969	bpxeew6rkkwp	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:42:36.542768+00	2026-05-29 06:42:36.818569+00	nvutzjoiiyuj	b61a4643-ec2e-40b8-9e12-2ffebe17b920
00000000-0000-0000-0000-000000000000	979	3akznpzbomb5	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:04.08648+00	2026-05-29 06:43:04.367213+00	llwpxdbhfcb3	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	970	zxq4br3p3dph	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:42:36.819849+00	2026-05-29 06:42:37.101793+00	bpxeew6rkkwp	b61a4643-ec2e-40b8-9e12-2ffebe17b920
00000000-0000-0000-0000-000000000000	971	a7rjeb4xgw3w	2e83ba6a-9778-4e84-80b2-168409debced	f	2026-05-29 06:42:37.102847+00	2026-05-29 06:42:37.102847+00	zxq4br3p3dph	b61a4643-ec2e-40b8-9e12-2ffebe17b920
00000000-0000-0000-0000-000000000000	980	av3pvtgnxfdc	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:04.36747+00	2026-05-29 06:43:04.655574+00	3akznpzbomb5	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	981	go73424uniyn	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:04.655938+00	2026-05-29 06:43:04.930667+00	av3pvtgnxfdc	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	982	twu4tbvyph67	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:04.931561+00	2026-05-29 06:43:05.215948+00	go73424uniyn	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	983	zavh7pdghgly	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:05.216592+00	2026-05-29 06:43:05.499217+00	twu4tbvyph67	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	984	fc3qnxtm2vud	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:05.500164+00	2026-05-29 06:43:05.788815+00	zavh7pdghgly	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	985	5jvbs7ifhiwy	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:43:05.789363+00	2026-05-29 06:43:06.066612+00	fc3qnxtm2vud	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	986	ljohmjhddctx	2e83ba6a-9778-4e84-80b2-168409debced	f	2026-05-29 06:43:06.067344+00	2026-05-29 06:43:06.067344+00	5jvbs7ifhiwy	0ece92fa-53df-42db-a509-8b2b01ce3321
00000000-0000-0000-0000-000000000000	988	hw25ujgd5s3k	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:50.231883+00	2026-05-29 06:44:50.650648+00	\N	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	989	tjazmq3gt2mg	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:50.652054+00	2026-05-29 06:44:51.241621+00	hw25ujgd5s3k	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	990	xyqpfdb2nmrq	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:51.243369+00	2026-05-29 06:44:51.544028+00	tjazmq3gt2mg	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	991	ojp2kwsv3kfx	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:51.544588+00	2026-05-29 06:44:51.8738+00	xyqpfdb2nmrq	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	992	yitpiswtik4a	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:51.874766+00	2026-05-29 06:44:52.174248+00	ojp2kwsv3kfx	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	993	5qv7u34tayko	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:52.174616+00	2026-05-29 06:44:52.468102+00	yitpiswtik4a	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	994	4uyyf4ak667g	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:52.468761+00	2026-05-29 06:44:52.755771+00	5qv7u34tayko	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	995	hef4vfx3j6ir	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:52.756517+00	2026-05-29 06:44:53.119471+00	4uyyf4ak667g	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	996	uv7yxiv3afsc	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:53.121431+00	2026-05-29 06:44:53.412813+00	hef4vfx3j6ir	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	997	e2co43krotbb	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:53.413204+00	2026-05-29 06:44:53.75378+00	uv7yxiv3afsc	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	998	emtwfbzmigab	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:53.754253+00	2026-05-29 06:44:54.04702+00	e2co43krotbb	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	999	y4b6vh2g3yur	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:54.047499+00	2026-05-29 06:44:54.342129+00	emtwfbzmigab	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1000	qatzxi3nyx54	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:54.343105+00	2026-05-29 06:44:54.633106+00	y4b6vh2g3yur	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1001	wihc7zqt6uqf	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:54.633392+00	2026-05-29 06:44:54.923419+00	qatzxi3nyx54	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1002	ngh6vkjyah7t	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:54.923751+00	2026-05-29 06:44:55.212989+00	wihc7zqt6uqf	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1003	d655sh7bvvwv	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:55.213816+00	2026-05-29 06:44:55.503847+00	ngh6vkjyah7t	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1075	6zcz2lf6v5e2	ea5561b5-6918-4212-83d9-5e48dec790ce	f	2026-06-06 07:41:27.286989+00	2026-06-06 07:41:27.286989+00	\N	5678ad3d-a932-4b82-80e2-0b04316326a8
00000000-0000-0000-0000-000000000000	1004	qf6b42o6p2gn	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:55.504469+00	2026-05-29 06:44:55.802394+00	d655sh7bvvwv	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1005	5bkcxjn7byff	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:55.802795+00	2026-05-29 06:44:56.089784+00	qf6b42o6p2gn	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1006	tjp7u7f2rtzc	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:56.091008+00	2026-05-29 06:44:56.380446+00	5bkcxjn7byff	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1007	utow4kr3atzg	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:56.382055+00	2026-05-29 06:44:56.672054+00	tjp7u7f2rtzc	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1008	hxawuqyutgts	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:56.672373+00	2026-05-29 06:44:56.964353+00	utow4kr3atzg	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1084	cdmgh5foznf7	bc00594c-8776-4bef-9d32-cf6176f89f81	t	2026-06-14 13:59:50.348729+00	2026-06-15 13:21:03.905962+00	\N	9869946c-8777-4c38-9bf8-6060915720dd
00000000-0000-0000-0000-000000000000	1009	47r5h47v42mg	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:56.965773+00	2026-05-29 06:44:57.24927+00	hxawuqyutgts	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1056	ezexqay7f75s	b84fe995-c654-433b-949a-5d14b471481b	f	2026-05-29 07:32:40.94995+00	2026-05-29 07:32:40.94995+00	\N	b71c0817-a47b-4c03-8ed3-4d0c8cfd8bad
00000000-0000-0000-0000-000000000000	1010	f7h35os6agwx	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:57.250208+00	2026-05-29 06:44:57.55352+00	47r5h47v42mg	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1011	htx7v6knnzrx	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:57.554596+00	2026-05-29 06:44:57.852909+00	f7h35os6agwx	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1012	turig3ymxscz	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:57.853815+00	2026-05-29 06:44:58.150777+00	htx7v6knnzrx	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1013	vvem6oyq2xg7	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:58.15114+00	2026-05-29 06:44:58.442106+00	turig3ymxscz	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1014	eufsd7vfwjlq	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:58.443463+00	2026-05-29 06:44:58.733765+00	vvem6oyq2xg7	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1015	44p6jsopx3u4	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:58.734965+00	2026-05-29 06:44:59.01969+00	eufsd7vfwjlq	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1016	yw2grrsc25vx	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:59.020142+00	2026-05-29 06:44:59.299383+00	44p6jsopx3u4	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1017	4bedbssyrgk6	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:59.300115+00	2026-05-29 06:44:59.596263+00	yw2grrsc25vx	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1018	d6vsfsz6vvtn	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:59.597017+00	2026-05-29 06:44:59.882476+00	4bedbssyrgk6	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1019	w4jlvx5wydjq	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:44:59.883614+00	2026-05-29 06:45:00.175436+00	d6vsfsz6vvtn	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1020	eym5wwlnuv42	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:00.175989+00	2026-05-29 06:45:00.461849+00	w4jlvx5wydjq	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1021	fskum6ovueq5	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:00.464011+00	2026-05-29 06:45:00.757996+00	eym5wwlnuv42	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1022	knd7q5z6jm3r	2e83ba6a-9778-4e84-80b2-168409debced	f	2026-05-29 06:45:00.759602+00	2026-05-29 06:45:00.759602+00	fskum6ovueq5	3ce6c222-95d3-46c9-8dc5-974ba870abfb
00000000-0000-0000-0000-000000000000	1023	6wyilrcar24j	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:36.328722+00	2026-05-29 06:45:36.639973+00	\N	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1024	syy56ctrje2p	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:36.640701+00	2026-05-29 06:45:37.213827+00	6wyilrcar24j	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1025	cnflzxjto5s4	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:37.215011+00	2026-05-29 06:45:37.50619+00	syy56ctrje2p	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1026	p2ke5cndmlx6	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:37.507526+00	2026-05-29 06:45:37.810353+00	cnflzxjto5s4	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1027	pfao6mdolfh2	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:37.811541+00	2026-05-29 06:45:38.096675+00	p2ke5cndmlx6	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1028	y5vuyjppi4ru	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:38.09796+00	2026-05-29 06:45:38.378201+00	pfao6mdolfh2	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1029	6t6sa5yw7rvj	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:38.378838+00	2026-05-29 06:45:38.660294+00	y5vuyjppi4ru	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1030	tlkzpe6rtvs5	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:38.660616+00	2026-05-29 06:45:38.939581+00	6t6sa5yw7rvj	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1031	t6uhoq2lmp6u	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:38.940135+00	2026-05-29 06:45:39.224903+00	tlkzpe6rtvs5	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1032	e2lefuxlaygi	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:39.226163+00	2026-05-29 06:45:39.514497+00	t6uhoq2lmp6u	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1033	e7jsadyighkj	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:39.51542+00	2026-05-29 06:45:39.81176+00	e2lefuxlaygi	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1034	5ti3fbkwtith	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:39.813359+00	2026-05-29 06:45:40.090285+00	e7jsadyighkj	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1035	zac6jc2igyea	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:40.090973+00	2026-05-29 06:45:40.366979+00	5ti3fbkwtith	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1036	oejlqlskq7qe	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:40.368619+00	2026-05-29 06:45:40.649126+00	zac6jc2igyea	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1037	h4w6slceygvo	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:40.649445+00	2026-05-29 06:45:40.925595+00	oejlqlskq7qe	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1038	xw2htox7i3vc	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:40.926426+00	2026-05-29 06:45:41.228002+00	h4w6slceygvo	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1039	f4rsabrfltq2	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:41.229474+00	2026-05-29 06:45:41.513494+00	xw2htox7i3vc	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1040	gyjjoefe4iqi	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:41.514627+00	2026-05-29 06:45:41.802141+00	f4rsabrfltq2	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1041	imy766aixrb5	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:41.803581+00	2026-05-29 06:45:42.084568+00	gyjjoefe4iqi	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1042	jhogq3ozpl5s	2e83ba6a-9778-4e84-80b2-168409debced	t	2026-05-29 06:45:42.08505+00	2026-05-29 06:45:42.370401+00	imy766aixrb5	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
00000000-0000-0000-0000-000000000000	1043	zxy6su6kwjqc	2e83ba6a-9778-4e84-80b2-168409debced	f	2026-05-29 06:45:42.371424+00	2026-05-29 06:45:42.371424+00	jhogq3ozpl5s	a76f5fed-6a03-40d9-b2d7-2acf895ce7d8
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
20260219120000
20260302000000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
8d0c8278-d6b4-4290-b0ed-080c07d65a13	f6e82f04-701a-4e83-84a9-b311eaed6db2	2026-04-16 16:04:23.906458+00	2026-04-16 16:04:23.906458+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	49.37.158.3	\N	\N	\N	\N	\N
4b4a996f-9979-44e4-8b0c-fe1e62464b30	f6601227-10dc-4bb5-9be0-a48df646882c	2026-03-10 04:37:16.0537+00	2026-03-10 04:37:16.0537+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36	119.235.53.243	\N	\N	\N	\N	\N
b8591ffa-b91f-4eb3-b644-075e68adeb47	b84fe995-c654-433b-949a-5d14b471481b	2026-05-28 07:06:25.313582+00	2026-05-29 06:26:21.510592+00	\N	aal1	\N	2026-05-29 06:26:21.510503	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	106.214.0.232	\N	\N	\N	\N	\N
b5e61792-8088-40c1-bdd9-860c9c62cc8b	b84fe995-c654-433b-949a-5d14b471481b	2026-05-29 06:37:50.367103+00	2026-05-29 06:37:50.367103+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	106.214.0.232	\N	\N	\N	\N	\N
a76f5fed-6a03-40d9-b2d7-2acf895ce7d8	2e83ba6a-9778-4e84-80b2-168409debced	2026-05-29 06:45:36.326827+00	2026-05-29 06:45:42.374544+00	\N	aal1	\N	2026-05-29 06:45:42.374446	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	49.37.158.12	\N	\N	\N	\N	\N
8603c917-e253-4e42-bd8d-a8be14d40f94	f6601227-10dc-4bb5-9be0-a48df646882c	2026-05-28 07:12:18.113151+00	2026-05-28 07:12:18.113151+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	106.214.0.232	\N	\N	\N	\N	\N
0ece92fa-53df-42db-a509-8b2b01ce3321	2e83ba6a-9778-4e84-80b2-168409debced	2026-05-29 06:43:01.726011+00	2026-05-29 06:43:06.070164+00	\N	aal1	\N	2026-05-29 06:43:06.070072	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	49.37.158.12	\N	\N	\N	\N	\N
b61a4643-ec2e-40b8-9e12-2ffebe17b920	2e83ba6a-9778-4e84-80b2-168409debced	2026-05-29 06:42:34.797751+00	2026-05-29 06:42:37.105919+00	\N	aal1	\N	2026-05-29 06:42:37.105804	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	49.37.158.12	\N	\N	\N	\N	\N
b4a49cb0-0b5a-4295-a106-acaf14602e9b	2e83ba6a-9778-4e84-80b2-168409debced	2026-05-29 06:47:35.671476+00	2026-05-29 06:47:35.671476+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	49.37.158.12	\N	\N	\N	\N	\N
3ce6c222-95d3-46c9-8dc5-974ba870abfb	2e83ba6a-9778-4e84-80b2-168409debced	2026-05-29 06:44:50.187517+00	2026-05-29 06:45:00.761756+00	\N	aal1	\N	2026-05-29 06:45:00.761657	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	49.37.158.12	\N	\N	\N	\N	\N
d967d768-9611-4b9d-adcc-0af86ad909bb	b84fe995-c654-433b-949a-5d14b471481b	2026-05-28 09:37:26.601753+00	2026-05-28 09:37:26.601753+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	49.37.156.51	\N	\N	\N	\N	\N
b71c0817-a47b-4c03-8ed3-4d0c8cfd8bad	b84fe995-c654-433b-949a-5d14b471481b	2026-05-29 07:32:40.947714+00	2026-05-29 07:32:40.947714+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	49.37.158.12	\N	\N	\N	\N	\N
e5bf4bab-8481-4261-891a-11e20b5b233b	bc00594c-8776-4bef-9d32-cf6176f89f81	2026-06-18 06:36:49.912791+00	2026-06-18 06:36:49.912791+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	49.37.157.118	\N	\N	\N	\N	\N
661ab255-7150-4bb1-af9c-3c55d35128a7	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-05-28 08:59:22.441108+00	2026-05-28 14:47:16.885173+00	\N	aal1	\N	2026-05-28 14:47:16.885066	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	49.37.156.51	\N	\N	\N	\N	\N
4efc29ef-893a-41d5-8bc4-5639ef427ee9	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-05-28 09:25:20.015103+00	2026-05-28 14:47:42.499541+00	\N	aal1	\N	2026-05-28 14:47:42.499444	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	49.37.156.51	\N	\N	\N	\N	\N
5678ad3d-a932-4b82-80e2-0b04316326a8	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-06-06 07:41:27.280068+00	2026-06-06 07:41:27.280068+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	106.205.28.37	\N	\N	\N	\N	\N
9869946c-8777-4c38-9bf8-6060915720dd	bc00594c-8776-4bef-9d32-cf6176f89f81	2026-06-14 13:59:50.347477+00	2026-06-15 13:21:03.977942+00	\N	aal1	\N	2026-06-15 13:21:03.9774	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	27.57.93.184	\N	\N	\N	\N	\N
7e579c1b-3573-4b6e-9034-2c4ac1a526d6	bc00594c-8776-4bef-9d32-cf6176f89f81	2026-06-06 07:47:55.893249+00	2026-06-06 07:47:55.893249+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	106.205.28.37	\N	\N	\N	\N	\N
6f5852aa-158f-481d-a703-ce92c4617207	f6601227-10dc-4bb5-9be0-a48df646882c	2026-06-06 08:10:41.29826+00	2026-06-06 08:10:41.29826+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36	106.205.28.37	\N	\N	\N	\N	\N
2a46e00f-083f-4fc9-aa1d-9550404b6ca4	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-06-14 12:38:51.184578+00	2026-06-14 12:38:51.184578+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	49.37.150.222	\N	\N	\N	\N	\N
e62301df-9038-444d-95a9-a66e1c30bfbd	bc00594c-8776-4bef-9d32-cf6176f89f81	2026-06-16 05:47:37.786074+00	2026-06-16 05:47:37.786074+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	49.37.158.111	\N	\N	\N	\N	\N
466e150b-5557-4534-bb42-71ea04aba575	bc00594c-8776-4bef-9d32-cf6176f89f81	2026-06-16 06:53:09.341637+00	2026-06-16 06:53:09.341637+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	49.37.158.111	\N	\N	\N	\N	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	b280f8c8-b05a-4237-b606-802420092eb1	authenticated	authenticated	23r11a67c7@gcet.edu.in	$2a$10$Hw0R100d6KpNcNHDAVZVou1oP1996BIlcnJYAQqp1rCf5rhBxryOi	2026-02-14 05:26:50.4084+00	\N		2026-02-14 05:26:30.899003+00		\N			\N	2026-02-14 05:27:28.154323+00	{"provider": "email", "providers": ["email"]}	{"sub": "b280f8c8-b05a-4237-b606-802420092eb1", "name": "advika", "email": "23r11a67c7@gcet.edu.in", "email_verified": true, "phone_verified": false}	\N	2026-02-14 05:26:30.863318+00	2026-02-14 05:27:28.157119+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	b84fe995-c654-433b-949a-5d14b471481b	authenticated	authenticated	23r11a0546@gcet.edu.in	$2a$10$6PWqyEbPVahnILEsDlnrZ.N/PzHXRzWyYq2f.xDPnVIcB.TFeQEpu	2026-03-03 08:29:21.748028+00	\N		2026-03-03 08:25:15.234103+00		\N			\N	2026-05-29 07:32:40.947621+00	{"provider": "email", "providers": ["email"]}	{"sub": "b84fe995-c654-433b-949a-5d14b471481b", "name": "rishik", "email": "23r11a0546@gcet.edu.in", "email_verified": true, "phone_verified": false}	\N	2026-03-03 08:25:15.22731+00	2026-06-15 06:11:38.203768+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	bc00594c-8776-4bef-9d32-cf6176f89f81	authenticated	authenticated	23r11a0531@gcet.edu.in	$2a$10$ILyeD8yB/qHwj.uEbEYng.ZiV2hMNoImNvj4.Dp/CHT9YYTQn6UdW	2026-05-29 07:20:38.363541+00	\N		2026-05-29 07:15:19.796459+00		\N			\N	2026-06-18 06:36:49.911087+00	{"provider": "email", "providers": ["email"]}	{"sub": "bc00594c-8776-4bef-9d32-cf6176f89f81", "name": "Vivek Vardhan", "year": "4", "email": "23r11a0531@gcet.edu.in", "tenant_id": "0ee52668-ea70-4740-9f7b-b15ba5535254", "department": "CSE", "email_verified": true, "phone_verified": false}	\N	2026-05-29 07:15:19.688332+00	2026-06-18 06:36:49.950296+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	2e83ba6a-9778-4e84-80b2-168409debced	authenticated	authenticated	23r11a0515@gcet.edu.in	$2a$10$qxp3ooqfxDqfCR/Er/zWiukQmoP4OOINmMTbO1xPjkWtsBb0/wAvW	2026-05-29 05:55:41.460556+00	\N		2026-05-29 05:55:01.099802+00		\N			\N	2026-06-16 05:46:45.500222+00	{"provider": "email", "providers": ["email"]}	{"sub": "2e83ba6a-9778-4e84-80b2-168409debced", "name": "Advika", "year": "4", "email": "23r11a0515@gcet.edu.in", "tenant_id": "0ee52668-ea70-4740-9f7b-b15ba5535254", "department": "CSE", "email_verified": true, "phone_verified": false}	\N	2026-05-29 05:55:01.037614+00	2026-06-16 05:46:45.526628+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	ea5561b5-6918-4212-83d9-5e48dec790ce	authenticated	authenticated	23r11a0544@gcet.edu.in	$2a$10$qeFWBM14aNcOZHN7sulZFugqnpIJNTFjzope/uzeiZvsTK6a5pE1K	2026-02-10 15:04:07.871251+00	\N		\N		\N			\N	2026-06-18 06:29:10.236103+00	{"provider": "email", "providers": ["email"]}	{"sub": "ea5561b5-6918-4212-83d9-5e48dec790ce", "name": "Jay", "email": "23r11a0544@gcet.edu.in", "email_verified": true, "phone_verified": false}	\N	2026-02-10 15:03:19.438845+00	2026-06-18 06:29:10.253826+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	f6601227-10dc-4bb5-9be0-a48df646882c	authenticated	authenticated	23r11a0505@gcet.edu.in	$2a$10$JoIF2WbMXOA.zSsS594QaO8YpgW1j62hLHGszIwLM7AvkcAtvlSGW	2026-03-10 04:37:16.046228+00	\N		2026-03-10 04:36:59.199945+00		\N			\N	2026-06-06 08:10:41.29817+00	{"provider": "email", "providers": ["email"]}	{"sub": "f6601227-10dc-4bb5-9be0-a48df646882c", "name": "Shivani", "email": "23r11a0505@gcet.edu.in", "email_verified": true, "phone_verified": false}	\N	2026-03-10 04:36:59.157124+00	2026-06-06 08:10:41.306454+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	ec79d798-6f6f-4549-8d79-edd15870b43b	authenticated	authenticated	23r11a0566@gcet.edu.in	$2a$10$SoOh1We.JwePj0lg3AAY/.F.frMi9vT9djHexgOn69PS525lgHj0S	\N	\N	59c5025a182016539fc625b9dcc945b992f9334734da09d9d8a757e2	2026-02-15 18:58:18.482872+00		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{"sub": "ec79d798-6f6f-4549-8d79-edd15870b43b", "name": "lilly", "email": "23r11a0566@gcet.edu.in", "email_verified": false, "phone_verified": false}	\N	2026-02-15 18:58:18.435041+00	2026-02-15 18:58:22.009647+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	595d5afb-c1f6-47a7-b92a-96519c1fc36f	authenticated	authenticated	23r11a0513@gcet.edu.in	$2a$10$j8DgzenHXxTfVsX1oCRzN.4PYpBa.WQvq5oIf1dqrLJ5MY4ftBbrS	\N	\N	a10c1bac50098bc6c2f76bdff270755b9b91c3f6918a39cf378482d5	2026-03-06 16:16:51.323563+00		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{"sub": "595d5afb-c1f6-47a7-b92a-96519c1fc36f", "name": "Vaishnavi", "email": "23r11a0513@gcet.edu.in", "email_verified": false, "phone_verified": false}	\N	2026-03-06 16:16:51.299526+00	2026-03-06 16:16:54.303236+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	f6e82f04-701a-4e83-84a9-b311eaed6db2	authenticated	authenticated	21r11a05c0@gcet.edu.in	$2a$10$HH76AujlPZAvl1Hs6373BeAsc7CMb9ESTvPNT8jYj.MAp7KkHZIpS	2026-04-16 16:04:23.896036+00	\N		2026-04-16 16:03:43.344649+00		\N			\N	2026-05-28 07:23:05.683282+00	{"provider": "email", "providers": ["email"]}	{"sub": "f6e82f04-701a-4e83-84a9-b311eaed6db2", "name": "Abhaya", "year": "4", "email": "21r11a05c0@gcet.edu.in", "department": "CSE", "email_verified": true, "phone_verified": false}	\N	2026-04-16 16:03:43.239968+00	2026-05-28 07:23:05.712285+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	99abb06b-7974-45ae-887a-9a87e6ec9c36	authenticated	authenticated	23r11a0512@gcet.edu.in	$2a$10$6Ca38F.tvBPmdqYlcphwk.ajnAODdCi2i/kvpj2USvrQzl6NbAGOW	2026-03-06 16:07:11.50213+00	\N		2026-03-06 16:05:35.119243+00		\N			\N	2026-05-28 08:25:11.330989+00	{"provider": "email", "providers": ["email"]}	{"sub": "99abb06b-7974-45ae-887a-9a87e6ec9c36", "name": "Rishik", "email": "23r11a0512@gcet.edu.in", "email_verified": true, "phone_verified": false}	\N	2026-03-06 16:05:35.029377+00	2026-05-29 06:58:22.633727+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	d1645cf0-5274-43f6-94d5-f0db4c6dcabf	authenticated	authenticated	23r11a0511@gcet.edu.in	$2a$10$EqGeI1x/dT63agnVH5NkcuPU1rolqh2HcvzQ.UX2OYkoN2WmXAcJO	2026-03-03 08:31:35.552407+00	\N		2026-03-03 08:24:42.185096+00		\N			\N	2026-05-29 06:42:19.272937+00	{"provider": "email", "providers": ["email"]}	{"sub": "d1645cf0-5274-43f6-94d5-f0db4c6dcabf", "name": "abhiram", "email": "23r11a0511@gcet.edu.in", "email_verified": true, "phone_verified": false}	\N	2026-03-03 08:24:42.139416+00	2026-05-29 07:32:19.771705+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_challenges (id, user_id, challenge_type, session_data, created_at, expires_at) FROM stdin;
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.webauthn_credentials (id, user_id, credential_id, public_key, attestation_type, aaguid, sign_count, transports, backup_eligible, backed_up, friendly_name, created_at, updated_at, last_used_at) FROM stdin;
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: cron; Owner: supabase_admin
--

COPY cron.job (jobid, schedule, command, nodename, nodeport, database, username, active, jobname) FROM stdin;
1	30 2 * * *	 select public.archive_past_events('7 days'::interval); 	localhost	5432	postgres	postgres	t	archive-past-events-daily
\.


--
-- Data for Name: job_run_details; Type: TABLE DATA; Schema: cron; Owner: supabase_admin
--

COPY cron.job_run_details (jobid, runid, job_pid, database, username, command, status, return_message, start_time, end_time) FROM stdin;
1	1	666301	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-05-29 02:30:00.244129+00	2026-05-29 02:30:00.382624+00
1	11	1807177	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-08 02:30:00.202573+00	2026-06-08 02:30:00.306636+00
1	19	2270687	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-16 02:30:00.15026+00	2026-06-16 02:30:00.277305+00
1	2	782168	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-05-30 02:30:00.188011+00	2026-05-30 02:30:00.311091+00
1	12	1892792	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-09 02:30:00.166455+00	2026-06-09 02:30:00.342658+00
1	3	893733	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-05-31 02:30:00.183743+00	2026-05-31 02:30:00.288865+00
1	4	1005529	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-01 02:30:00.171638+00	2026-06-01 02:30:00.281639+00
1	20	2325266	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-17 02:30:00.178909+00	2026-06-17 02:30:00.276748+00
1	13	1948130	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-10 02:30:00.18572+00	2026-06-10 02:30:00.283236+00
1	5	1119136	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-02 02:30:00.181083+00	2026-06-02 02:30:00.273096+00
1	6	1234070	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-03 02:30:00.162969+00	2026-06-03 02:30:00.26671+00
1	14	2001666	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-11 02:30:00.131814+00	2026-06-11 02:30:00.225626+00
1	7	1348466	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-04 02:30:00.165843+00	2026-06-04 02:30:00.353506+00
1	21	2384229	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-18 02:30:00.162372+00	2026-06-18 02:30:00.270298+00
1	15	2055457	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-12 02:30:00.168228+00	2026-06-12 02:30:00.283602+00
1	8	1464877	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-05 02:30:00.173444+00	2026-06-05 02:30:00.283127+00
1	9	1578602	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-06 02:30:00.162793+00	2026-06-06 02:30:00.255564+00
1	16	2108762	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-13 02:30:00.156721+00	2026-06-13 02:30:00.272077+00
1	10	1693821	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-07 02:30:00.190641+00	2026-06-07 02:30:00.304767+00
1	17	2162334	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-14 02:30:00.194192+00	2026-06-14 02:30:00.308325+00
1	18	2216222	postgres	postgres	 select public.archive_past_events('7 days'::interval); 	succeeded	1 row	2026-06-15 02:30:00.181727+00	2026-06-15 02:30:00.276996+00
\.


--
-- Data for Name: contest_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contest_settings (id, problems_unlock_at, created_at, department_unlocks_at, department_closes_at, tenant_id) FROM stdin;
af683964-9811-45aa-9147-b4858ae1d10b	2026-05-29 07:04:23+00	2026-05-29 06:35:18+00	2026-05-29 06:38:24+00	2026-05-30 07:35:32+00	0ee52668-ea70-4740-9f7b-b15ba5535254
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, name, code, location, created_at, updated_at) FROM stdin;
b9c63007-e0dd-401c-a01d-0f7351c5d6ed	Civil Engineering	CE	Main Campus	2026-03-10 05:35:58.914763+00	2026-03-10 05:35:58.914763+00
f81975e7-3f24-42b7-a046-330effce532c	Information Technology	IT	Main Campus	2026-03-10 05:35:58.914763+00	2026-03-10 05:35:58.914763+00
684525f8-6dcc-40b3-9fe3-0c9da7d70f8e	Computer Science & Engineering	CSE	Main Campus	2026-03-10 05:35:58.914763+00	2026-03-10 05:35:58.914763+00
186cc1c0-b797-40bf-b9d8-b8431531ecf3	Electronics & Communication Engineering	ECE	Main Campus	2026-03-10 05:35:58.914763+00	2026-03-10 05:35:58.914763+00
bedf8eac-4458-40af-af3b-6941e44adf8e	Electrical & Electronics Engineering	EEE	Main Campus	2026-03-10 05:35:58.914763+00	2026-03-10 05:35:58.914763+00
c5bbdf77-79b5-4304-8fdc-59a4e87c2a53	Mechanical Engineering	ME	Main Campus	2026-03-10 05:35:58.914763+00	2026-03-10 05:35:58.914763+00
68cc2aff-73d9-4704-8c35-452efe2c028c	Business Administration	BA	Main Campus	2026-03-10 05:35:58.914763+00	2026-03-10 05:35:58.914763+00
\.


--
-- Data for Name: event_registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_registrations (id, event_id, user_id, created_at) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, title, description, event_date, location, created_at, updated_at, is_active, event_type, mode, image_url, organizer_name, organizer_contact, registration_deadline, max_participants, problem_statement_deadline, registration_start_date, has_problem_statement, resource_person, tenant_id, registration_link) FROM stdin;
826e7f29-0b3b-4248-81c8-b17c3c7e54b9	hackathon	student hackathon	2026-06-12 23:52:00+00	Seminar Hall 2	2026-05-27 18:22:38.981304+00	2026-05-27 18:22:38.981304+00	t	Workshop	Hybrid	https://nducuwfztcjhelztdzbc.supabase.co/storage/v1/object/public/event_images/event_1779906158133.webp	\N	\N	2026-05-31 23:52:00+00	\N	2026-05-27 18:22:38.981304+00	2026-05-27 18:22:38.981304+00	f	\N	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6	https://www.instagram.com/
171087e5-6199-4247-a5b4-70e272e1bca1	HackathonAPEX	National Level Hackathon	2026-06-20 01:43:00+00	Seminar Hall 1	2026-06-16 07:57:14.893575+00	2026-06-16 07:57:14.893575+00	t	Hackathon	Offline		\N	\N	\N	\N	2026-06-16 07:57:14.893575+00	2026-06-16 07:57:14.893575+00	f	\N	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6	https://docs.google.com/forms/d/1eIpvfF9oODrdHLzZXYnV4kXbifMyoWLXK9N_n7ZJ5ho
7e6f5b5a-d9cb-449e-80cc-87c3e0c79f93	Webinar	dediibe	2026-06-28 07:14:00+00	Innovation Lab	2026-06-16 07:58:36.723225+00	2026-06-16 07:58:36.723225+00	t	webinar	Online	https://nducuwfztcjhelztdzbc.supabase.co/storage/v1/object/public/event_images/event_1781554533004.png	\N	\N	\N	\N	2026-06-16 07:58:36.723225+00	2026-06-16 07:58:36.723225+00	f	\N	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6	https://docs.google.com/forms/d/1eIpvfF9oODrdHLzZXYnV4kXbifMyoWLXK9N_n7ZJ5ho
\.


--
-- Data for Name: events_archive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events_archive (id, title, description, event_date, location, created_at, updated_at, is_active, event_type, mode, image_url, organizer_name, organizer_contact, registration_deadline, max_participants, problem_statement_deadline, registration_start_date, has_problem_statement, resource_person, tenant_id, registration_link, archived_at) FROM stdin;
00d57880-e404-4eea-814e-eee8ad747f9b	Hackverse	A hackathon is a time-bound event where participants collaborate to develop innovative solutions to real-world problems using technology.	2026-04-30 20:34:00+00	Seminar Hall 2	2026-04-03 15:05:22.689336+00	2026-04-03 15:05:22.689336+00	t	hackathon	Online		Advika	9876543210	2026-04-22 20:35:00+00	\N	2026-04-03 15:05:22.689336+00	2026-04-03 15:05:22.689336+00	f	\N	0ee52668-ea70-4740-9f7b-b15ba5535254	\N	2026-05-29 02:30:00.244155+00
1791a3aa-163e-42cd-905e-0e396f3973e8	event1	event1 desc	2026-03-16 11:20:00+00	Innovation Lab	2026-03-10 05:53:07.263283+00	2026-03-10 05:53:07.263283+00	t	Workshop	Hybrid		org1	8765432094	2026-03-14 11:21:00+00	25	2026-03-10 05:53:07.263283+00	2026-03-10 05:53:07.263283+00	f	\N	0ee52668-ea70-4740-9f7b-b15ba5535254	\N	2026-05-29 02:30:00.244155+00
46ba0b05-30a7-4480-ab7b-49b09165c1fd	event4	4th	2026-02-28 18:50:00+00	keesara	2026-03-03 07:14:36.838933+00	2026-03-03 07:14:36.838933+00	t	hackathon	Offline		lika	bdwubdhwbhb	2026-02-26 18:50:00+00	\N	2026-03-03 07:14:36.838933+00	2026-03-03 07:14:36.838933+00	f	\N	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6	\N	2026-05-29 02:30:00.244155+00
51411070-c3e4-432c-84fd-f68bf680d71f	event5	event5	2026-02-28 18:51:00+00	ksndndjefk	2026-03-03 07:15:15.736982+00	2026-03-03 07:15:15.736982+00	t	kefbkwje	Online		71736824	l2rkrkjn5r	2026-02-24 18:51:00+00	\N	2026-03-03 07:15:15.736982+00	2026-03-03 07:15:15.736982+00	f	\N	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6	\N	2026-05-29 02:30:00.244155+00
218058b8-b7a5-459b-9ff7-0f45d5a81577	geenovate	hackathon for students	2026-05-27 10:31:00+00	Seminar Hall 2	2026-05-25 05:02:25.840432+00	2026-05-25 05:02:25.840432+00	t	Workshop	Offline		\N	\N	2026-05-23 10:32:00+00	1	2026-05-25 05:02:25.840432+00	2026-05-25 05:02:25.840432+00	f	\N	0ee52668-ea70-4740-9f7b-b15ba5535254	\N	2026-06-04 02:30:00.165863+00
9f2caecd-c52e-4b49-b492-7bcb1f564225	ferfergregr	frgergregr	2026-06-01 10:25:00+00	rewq	2026-05-27 17:56:17.320553+00	2026-05-27 17:56:17.320553+00	t	gfds	Hybrid	https://nducuwfztcjhelztdzbc.supabase.co/storage/v1/object/public/event_images/event_1779905902167.webp	\N	\N	2026-05-30 10:26:00+00	\N	2026-05-27 17:56:17.320553+00	2026-05-27 17:56:17.320553+00	f	\N	0ee52668-ea70-4740-9f7b-b15ba5535254	https://docs.google.com/forms/d/1eIpvfF9oODrdHLzZXYnV4kXbifMyoWLXK9N_n7ZJ5ho	2026-06-09 02:30:00.166473+00
\.


--
-- Data for Name: page_content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.page_content (id, page_name, section_key, content, updated_at, tenant_id) FROM stdin;
28ddbd9b-b34c-4381-b7d1-b67ad90e4735	about	header	{"title": "What is inCamp", "subtitle": "", "teamTitle": "The Team", "teamSubtitle": "Behind inCamp"}	2026-05-29 07:20:31.755+00	0ee52668-ea70-4740-9f7b-b15ba5535254
bdc947ce-ee2e-4c3e-85e6-0c5e0e53abcf	events	page_header	{"title": "Events", "styles": {"title": {"fontSize": "text-4xl", "animation": "none", "fontStyle": "default", "textColor": "#f8f7f7", "fontWeight": "semibold"}, "subtitle": {"fontSize": "text-base", "animation": "none", "fontStyle": "default", "textColor": "#eff2f5", "fontWeight": "normal"}}, "subtitle": "Stay updated with the latest workshops, seminars, and competitions happening on campus. Join us to learn, network, and innovate tthis is events page\\nogether."}	2026-05-27 17:47:05.353+00	0ee52668-ea70-4740-9f7b-b15ba5535254
5a0071c1-fd3f-4d6e-b2de-64561fe91801	resources	downloads	{"title": "Downloads", "subtitle": "hi im downloads"}	2026-05-28 06:20:30.975+00	0ee52668-ea70-4740-9f7b-b15ba5535254
382fa9c6-827c-48d8-b644-4d460898ea36	event_structure	phases	[{"id": 0, "icon": "Target", "name": "Phase 0", "title": "Problem Discovery", "points": ["Observe challenges", "Validate problem", "Select statement"]}, {"id": 1, "icon": "Users", "name": "Phase 1", "title": "Team Formation", "points": ["Form team", "Register", "Submit problem"]}]	2026-02-04 15:39:18.785222+00	0ee52668-ea70-4740-9f7b-b15ba5535254
b4c1c049-2352-4224-ae8d-e0620cd32f2e	contact	general_info	{"email": "inCamp@gcet.edu.in", "phone": "+91 981276345", "address": "Geethanjali Campus, Hyderabad\\n"}	2026-03-25 06:12:54.022+00	0ee52668-ea70-4740-9f7b-b15ba5535254
25684097-d43d-446a-8f8e-5c0f5ecc2e9c	home	timeline_cards	[{"id": "72cafa00-7b2f-491e-a05e-7ece2c1d1e29", "name": "Phase 1", "title": "New Phase", "icon_url": null, "icon_name": "Rocket", "image_urls": ["https://nducuwfztcjhelztdzbc.supabase.co/storage/v1/object/public/resources/home_timeline_images/1780039084760_0_SwimLane.png"], "description": "Describe the next step in the journey."}, {"id": "05bd0eb3-aed3-453a-adc6-15827b42f6b2", "name": "Phase 2", "title": "New Phase", "icon_url": null, "image_urls": [], "description": "Describe the next step in the journey."}, {"id": "60170615-d562-4ad4-84b9-19c2e5284352", "name": "Phase 3", "title": "New Phase", "icon_url": null, "image_urls": [], "description": "Describe the next step in the journey."}, {"id": "a752caac-5044-490c-a41a-6edac3c39855", "name": "Phase 4", "title": "New Phase", "icon_url": null, "icon_name": null, "image_urls": [], "description": "Describe the next step in the journey."}, {"id": "efd886e8-204f-4336-99aa-c6ef2af64419", "name": "Phase 5", "title": "New Phase", "icon_url": null, "icon_name": null, "image_urls": [], "description": "Describe the next step in the journey."}]	2026-05-29 07:19:39.765+00	0ee52668-ea70-4740-9f7b-b15ba5535254
c87a3a43-665e-46d3-a047-f1cf7c1d4929	home	timeline_header	{"label": "journey cards", "title": "Event Journey", "subtitle": "How the phases of the events are ", "photo_url": "https://nducuwfztcjhelztdzbc.supabase.co/storage/v1/object/public/resources/home_timeline_header/1776163288369_IMG_7495.JPG", "photo_urls": ["https://nducuwfztcjhelztdzbc.supabase.co/storage/v1/object/public/resources/home_timeline_header/1780039175531_0_29thAugAgenda.jpg"]}	2026-05-29 07:19:39.765+00	0ee52668-ea70-4740-9f7b-b15ba5535254
2620fffa-73cb-411c-b511-dcc1dbf8d2da	contact	coordinators	[{"name": "Advika", "role": "Coordinator", "email": "23r11a0515@gmail.com", "phone": "9492362238", "description": "coordinates overall event"}]	2026-05-29 07:29:54.765+00	0ee52668-ea70-4740-9f7b-b15ba5535254
89806030-d144-4c88-8489-0adecf323775	home	hero	{"title": "inCamp", "chipText": "inCamp", "subtitle": "hi im sub-title", "backImage": "https://nducuwfztcjhelztdzbc.supabase.co/storage/v1/object/public/resources/home_hero_images/1781727387309-1.png", "frontImage": "/front.png", "heroStyles": {"title": {"fontSize": "text-7xl", "animation": "bounce", "textColor": "#fafafa"}, "subtitle": {"textColor": "#ffffff"}}, "sliderImages": ["https://nducuwfztcjhelztdzbc.supabase.co/storage/v1/object/public/resources/home_slider_images/1779534895422-blue.webp"]}	2026-06-17 20:16:31.944+00	0ee52668-ea70-4740-9f7b-b15ba5535254
e05d7711-3554-4aa2-8cee-b4802acd69fc	contact	contact_header	{"title": "Contact Us", "styles": {"title": {"color": "#ffffff", "effect": "none", "fontSize": "text-5xl", "fontType": "font-poppins", "fontWeight": "font-bold"}, "subtitle": {"color": "#dbeafe", "effect": "none", "fontSize": "text-lg", "fontType": "font-sans", "fontWeight": "font-normal"}, "backgroundColor": "#0b3a82"}, "subtitle": "Have questions? Reach out to our organizing team for assistance.", "enquiriesTitle": "General Enquiries", "organizingTitle": "Organizing Team"}	2026-05-29 07:29:54.765+00	0ee52668-ea70-4740-9f7b-b15ba5535254
66b3c02c-32a0-40a9-9cb1-7ec1d941b7c5	contact	general_enquiries	[{"id": "5066ba1e-e5a4-40d3-95a3-564d8a457993", "icon": "Mail", "title": "Email", "description": "inCamp@gcet.edu.in"}, {"id": "42015db8-a47e-4e24-97c3-a1e2f55b289b", "icon": "Phone", "title": "Helpline", "description": "+91 981276345"}, {"id": "98f3bb3f-c8fa-4d54-b2b4-8bd32c822d19", "icon": "MapPin", "title": "Address", "description": "Geethanjali Campus, Hyderabad\\n"}, {"id": "4fe2144b-73ac-4f2a-b79a-7a7d09d10c7a", "icon": "Info", "title": "info", "description": "In Geethanjali College "}]	2026-05-29 07:29:54.765+00	0ee52668-ea70-4740-9f7b-b15ba5535254
a6d37947-049f-45cd-b514-14dc61a1896e	about	team_cards	[{"id": "geenovate", "title": "Geenovate Foundation", "image_url": null, "description": "The driving force behind inCamp, fostering innovation and entrepreneurship across GCET."}, {"id": "patrons", "title": "Patrons & Leadership", "image_url": null, "description": "Chairman, Director, and institutional leaders providing vision and guidance."}, {"id": "core", "title": "Core Organisers", "image_url": null, "description": "Head Coordinator and 5 Co-Coordinators managing event operations and participant experience."}, {"id": "support", "title": "Department Support Group", "image_url": null, "description": "Academic supporters from each department ensuring curriculum alignment and mentorship."}, {"id": "partners", "title": "Partner Clubs & Councils", "image_url": null, "description": "Innovation Council, Tech Clubs, and professional bodies collaborating for success."}, {"id": "volunteers", "title": "Volunteers & Sponsors", "image_url": null, "description": "Dedicated student volunteers and external sponsors making this event possible."}]	2026-05-25 06:16:41.041+00	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
85ec90de-67a9-4de6-8f65-100d765964e7	home	hero	{"title": "outCamp", "chipText": "Chapter 1 — Innovation Begins Here", "subtitle": "Turning Campus Challenges into Countable changes", "backImage": "/back.png", "frontImage": "/front.png", "heroStyles": {"title": {"textColor": "#f9f5f5"}, "subtitle": {"textColor": "#eff2f5"}}, "sliderImages": ["/BackgroundSlider1.jpeg", "/BackgroundSlider2.JPG", "/BackgroundSlider3.JPG", "/BackgroundSlider4.jpeg", "/BackgroundSlider5.jpeg", "/BackgroundSlider6.jpeg", "/BackgroundSlider7.jpeg"]}	2026-05-27 22:24:31.674+00	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
9f26bd89-c657-4d32-a624-80cf0c55e851	home	timeline_cards	[{"id": "phase-0", "name": "Phase 0", "title": "Problem Discovery", "image_urls": [], "description": "Identify and document real campus challenges through observation and research."}, {"id": "phase-1", "name": "Phase 1", "title": "Team Formation & Registration", "image_urls": [], "description": "Form cross-functional teams and register with your chosen problem statement."}, {"id": "phase-2", "name": "Phase 2", "title": "Solution Ideation", "image_urls": [], "description": "Brainstorm, validate, and refine your innovative solution approach."}, {"id": "phase-3", "name": "Phase 3", "title": "Prototype Development", "image_urls": [], "description": "Build working prototypes and prepare comprehensive documentation."}, {"id": "phase-4", "name": "Phase 4", "title": "Final Pitch & Evaluation", "image_urls": [], "description": "Present your solution to the jury and compete for recognition and prizes."}]	2026-05-25 06:00:57.818+00	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
6f1c9eef-ef1e-4182-8f74-68f1e1ac3f95	home	timeline_header	{"label": "Event Journey", "title": "Your Path to Innovation", "subtitle": "the path", "photo_url": null, "photo_urls": []}	2026-05-25 06:00:57.818+00	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
a82734f5-d985-4244-beb5-a18b9a244d36	about	descriptive_boxes	[{"id": "box-1", "text": "inCamp is a student-driven innovation challenge designed to identify, analyse, and solve real-world problems within the campus ecosystem. We believe every challenge holds the seed of transformation.", "fontSize": "2xl", "animation": "fadeIn", "fontStyle": "default", "textColor": "#ffffff", "fontWeight": "bold", "textEffect": "none"}, {"id": "box-2", "text": "Through our structured 5D Framework — Discover, Define, Design, Develop, and Deliver — participants journey from problem identification to prototype creation, gaining invaluable entrepreneurial skills along the way.", "fontSize": "lg", "animation": "fadeIn", "fontStyle": "default", "textColor": "#e6e9ef", "fontWeight": "normal", "textEffect": "none"}]	2026-05-29 07:20:31.755+00	0ee52668-ea70-4740-9f7b-b15ba5535254
163b9b51-9598-431d-abfd-572518d28e94	about	description	{"fontStyle": "default", "paragraphs": ["inCamp is a student-driven innovation challenge designed to identify, analyse, and solve real-world problems within the campus ecosystem.\\n\\n", "Through our structured 5D Framework — Discover, Define, Design, Develop, and Deliver — participants journey from problem identification to prototype creation, gaining invaluable entrepreneurial skills along the way.\\n"]}	2026-05-27 15:11:14.921+00	0ee52668-ea70-4740-9f7b-b15ba5535254
44643046-5e87-477b-b0b1-319c0df76140	about	header	{"title": "What is inCamp?", "subtitle": "inCamp is a student-driven innovation challenge designed to identify, analysis, and solve real-world problems within the campus ecosystem. We believe every challenge holds the seed of transformation.", "teamTitle": "The Team", "teamSubtitle": "Behind inCamp"}	2026-05-25 06:16:41.041+00	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
cfc8dda5-6885-41f4-ac49-0aa0e5d130e7	about	description	{"fontStyle": "default", "paragraphs": ["inCamp is a student-driven innovation challenge designed to identify, analyse, and solve real-world problems within the campus ecosystem. We believe every challenge holds the seed of transformation", "Through our structured 5D Framework — Discover, Define, Design, Develop, and Deliver — participants journey from problem identification to prototype creation, gaining invaluable entrepreneurial skills along the way."]}	2026-05-25 06:16:41.041+00	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
f3681ea3-79ac-4555-a344-d1a1eef28eb6	about	team_cards	[{"id": "patrons", "title": "Patrons & Leadership", "image_url": "https://nducuwfztcjhelztdzbc.supabase.co/storage/v1/object/public/resources/about_cards/1780039224820_mukesh_kestwal.jpeg", "description": "Chairman, Director, and institutional leaders providing vision and guidance."}, {"id": "core", "title": "Core Organisers", "image_url": null, "description": "Head Coordinator and 5 Co-Coordinators managing event operations and participant experience."}, {"id": "support", "title": "Department Support Group", "image_url": null, "description": "Academic supporters from each department ensuring curriculum alignment and mentorship."}, {"id": "partners", "title": "Partner Clubs & Councils", "image_url": null, "description": "Innovation Council, Tech Clubs, and professional bodies collaborating for success."}, {"id": "volunteers", "title": "Volunteers & Sponsors", "image_url": null, "description": "Dedicated student volunteers and external sponsors making this event possible."}]	2026-05-29 07:20:31.755+00	0ee52668-ea70-4740-9f7b-b15ba5535254
\.


--
-- Data for Name: problem_statement_alerts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.problem_statement_alerts (id, recipient_user_id, problem_statement_id, type, title, description, priority, is_read, created_at, tenant_id) FROM stdin;
\.


--
-- Data for Name: problem_statement_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.problem_statement_attachments (id, problem_statement_id, uploaded_by, file_name, object_path, mime_type, file_size, created_at, tenant_id) FROM stdin;
\.


--
-- Data for Name: problem_statement_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.problem_statement_messages (id, problem_statement_id, sender_id, sender_role, recipient_role, content, is_read, created_at, tenant_id) FROM stdin;
\.


--
-- Data for Name: problem_statement_remarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.problem_statement_remarks (id, problem_statement_id, remark, author_id, created_at, tenant_id) FROM stdin;
\.


--
-- Data for Name: problem_statement_reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.problem_statement_reviews (id, problem_statement_id, reviewer_id, review_note, recommended_status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: problem_statements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.problem_statements (id, problem_statement_id, title, description, category, theme, created_at, detailed_description, department, status, created_by, department_id, faculty_owner, assigned_spoc, submission_batch_id, submitted_at, approved_at, revision_note, expected_outcomes, resource_requirements, timeline_milestones, budget_estimation, last_updated, event_id, admin_remark, max_registrations, curr_registrations, tenant_id) FROM stdin;
942f2ae6-1d04-4994-9637-4ef50f6cdb31	PS001	testing1 - ECE	testing1 - ECE desc	Hardware/Software	Community Innovation	2026-03-10 06:24:13.685955+00	testing1 - ECE detailed desc	Electronics & Communication Engineering	approved	b84fe995-c654-433b-949a-5d14b471481b	186cc1c0-b797-40bf-b9d8-b8431531ecf3	fac1-ece	spoc1-ece	\N	2026-03-10 06:24:13.943+00	2026-03-10 06:24:45.955+00	\N	\N	\N	\N	\N	2026-03-10 06:24:13.685955+00	\N	\N	6	0	0ee52668-ea70-4740-9f7b-b15ba5535254
b4585cd2-82f5-4990-bb8f-5d1093f25f41	PS-2026-6534	test 123	testing testig	Hardware/Software	Non-Academic	2026-05-28 08:32:41.680612+00	djdjm fivjfkbm fbfkb fgjfkm fmfbm fjfklmwjekbm dfgm	Mechanical Engineering	approved	99abb06b-7974-45ae-887a-9a87e6ec9c36	c5bbdf77-79b5-4304-8fdc-59a4e87c2a53	\N	\N	\N	2026-05-28 08:32:41.443+00	2026-05-28 08:33:29.757+00	\N	\N	\N	\N	\N	2026-05-28 08:32:41.680612+00	\N	\N	5	0	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
794da336-faef-4005-bb15-f2b96c503086	29779	testing2 - ece	testing2 - ECE desc	Hardware	Community Innovation	2026-03-10 06:40:23.618568+00	testing2 - ECE detailed desc	Electronics & Communication Engineering	approved	b84fe995-c654-433b-949a-5d14b471481b	186cc1c0-b797-40bf-b9d8-b8431531ecf3	fac2-ece	spoc2-ece	\N	2026-03-10 06:40:23.942+00	2026-03-10 09:28:21.404+00	\N	\N	\N	\N	\N	2026-03-10 06:40:23.618568+00	\N	\N	6	0	0ee52668-ea70-4740-9f7b-b15ba5535254
1e648b10-0f0f-4545-ac70-795c742890e8	PS002	testing1 - ME	testing1 - ME desc	Hardware	Academic	2026-03-10 06:18:06.889647+00	testing1 - ME detailed desc	Mechanical Engineering	approved	d1645cf0-5274-43f6-94d5-f0db4c6dcabf	c5bbdf77-79b5-4304-8fdc-59a4e87c2a53	fac1-me	spoc1-me	\N	2026-03-10 06:18:07.255+00	2026-03-10 06:24:42.196+00	\N	\N	\N	\N	\N	2026-03-10 06:18:06.889647+00	\N	\N	5	0	0ee52668-ea70-4740-9f7b-b15ba5535254
76eedffd-0a6a-40c5-862a-9389d83d0d2a	12345	arts & science 	hello	Hardware	Non-Academic	2026-03-23 09:19:49.838411+00	hello	\N	approved	ea5561b5-6918-4212-83d9-5e48dec790ce	186cc1c0-b797-40bf-b9d8-b8431531ecf3	\N	\N	\N	2026-03-23 09:19:49.567+00	2026-03-23 09:19:49.567+00	\N	\N	\N	\N	\N	2026-03-23 09:19:49.838411+00	\N	\N	\N	1	0ee52668-ea70-4740-9f7b-b15ba5535254
7aeaa458-b523-4bd0-a4ca-cbf309e3431f	25010	smart time table	implement a smart time table	Software	Academic	2026-05-27 15:20:10.366397+00		\N	approved	ea5561b5-6918-4212-83d9-5e48dec790ce	684525f8-6dcc-40b3-9fe3-0c9da7d70f8e	\N	\N	\N	2026-05-27 15:20:10.082+00	2026-05-27 15:20:10.082+00	\N	\N	\N	\N	\N	2026-05-27 15:20:10.366397+00	\N	\N	\N	1	0ee52668-ea70-4740-9f7b-b15ba5535254
e9f33cf4-21e1-4c54-a35c-61c9977767e3	54321	problem hard 	very hard to impliment	Hardware	Community Innovation	2026-05-28 09:19:46.465785+00	u need crazy expertiese to sollve this prob	\N	approved	ea5561b5-6918-4212-83d9-5e48dec790ce	bedf8eac-4458-40af-af3b-6941e44adf8e	\N	\N	\N	2026-05-28 09:19:47.518+00	2026-05-28 09:19:47.518+00	\N	\N	\N	\N	\N	2026-05-28 09:19:46.465785+00	\N	\N	13	0	0ee52668-ea70-4740-9f7b-b15ba5535254
d996c0e5-6a15-41c5-be30-b7743ceda7b9	PS003	testing1-cse	testing1 - cse desc	Software	Non-Academic	2026-03-10 06:15:55.659133+00	testing1 - cse detailed desc	Computer Science & Engineering	approved	\N	684525f8-6dcc-40b3-9fe3-0c9da7d70f8e	fac1-cse	spoc1-cse	\N	2026-03-10 06:15:55.99+00	2026-03-10 06:24:50.202+00	\N	\N	\N	\N	\N	2026-03-10 06:15:55.659133+00	\N	\N	4	0	0ee52668-ea70-4740-9f7b-b15ba5535254
e64f18cb-6944-480a-96a2-c5363dfdc6a6	PS-2026-4178	smart attendance	Design a smart attendance system for departments that uses facial recognition or QR-based authentication to automatically track student attendance and generate real-time reports for faculty	Software	Academic	2026-04-03 18:36:39.297925+00	Design a smart attendance system for departments that uses facial recognition or QR-based authentication to automatically track student attendance and generate real-time reports for faculty	Computer Science & Engineering	approved	\N	684525f8-6dcc-40b3-9fe3-0c9da7d70f8e	lalita	\N	\N	2026-04-03 18:36:40.023+00	2026-04-03 18:42:30.789+00	\N	\N	\N	\N	\N	2026-04-03 18:36:39.297925+00	\N	\N	5	0	0ee52668-ea70-4740-9f7b-b15ba5535254
ea3e53f6-e975-4db7-9c61-8b44ed2c84e3	PS-2026-6019	Economic problem	Economic	Hardware	Non-Academic	2026-04-15 09:52:12.298832+00	Economic	Computer Science & Engineering	pending_review	\N	684525f8-6dcc-40b3-9fe3-0c9da7d70f8e	\N	\N	\N	2026-04-15 09:52:10.697+00	\N	\N	\N	\N	\N	\N	2026-04-15 09:52:12.298832+00	\N	\N	\N	0	0ee52668-ea70-4740-9f7b-b15ba5535254
a4521cc3-64c7-4143-a72e-f9c8d8947e32	VIT-1002	AR Campus Navigation	Indoor navigation using AR.	Software	Smart Campus	2026-05-09 18:03:29.95091+00	\N	\N	approved	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-05-09 18:03:29.95091+00	\N	\N	15	4	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
0f98bf1a-d45a-4902-937e-80d9b00402f5	VIT-1001	Smart Waste Management	Build an AI waste segregation platform.	Software		2026-05-09 18:03:29.95091+00		\N	approved	\N	c5bbdf77-79b5-4304-8fdc-59a4e87c2a53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-05-09 18:03:29.95091+00	\N	\N	10	3	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
e96c3637-f8d3-443e-b269-1adb74770e32	2006	jelly man finder	find max jellybean in min time possible.	Hardware/Software	xlr8	2026-06-06 07:51:42.44417+00	use algos like dfs,bfs and find jellybeans.	\N	approved	bc00594c-8776-4bef-9d32-cf6176f89f81	f81975e7-3f24-42b7-a046-330effce532c	\N	\N	\N	2026-06-06 07:51:41.122+00	2026-06-06 07:51:41.122+00	\N	\N	\N	\N	\N	2026-06-06 07:51:42.44417+00	\N	\N	3	0	0ee52668-ea70-4740-9f7b-b15ba5535254
52809188-a629-4709-9005-90ee77240525	PS-2026-9494	smart attendance system	Design a smart attendance system for departments that uses facial recognition or QR-based authentication to automatically track student attendance and generate real-time reports for faculty	Software	Academic	2026-04-03 15:17:49.122534+00	Design a smart attendance system for departments that uses facial recognition or QR-based authentication to automatically track student attendance and generate real-time reports for faculty	Computer Science & Engineering	approved	\N	684525f8-6dcc-40b3-9fe3-0c9da7d70f8e	Latha	\N	\N	2026-04-03 15:17:49.893+00	2026-04-03 15:20:39.96+00	\N	\N	\N	\N	\N	2026-04-03 15:17:49.122534+00	\N	\N	4	0	0ee52668-ea70-4740-9f7b-b15ba5535254
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, name, email, role, created_at, phone, avatar_url, faculty_id, department_id, updated_at, department, year, tenant_id) FROM stdin;
bc00594c-8776-4bef-9d32-cf6176f89f81	Vivek Vardhan	23r11a0531@gcet.edu.in	admin	2026-05-29 07:15:19.685944+00	\N	\N	\N	\N	2026-06-06 07:26:14.030385+00	CSE	4	0ee52668-ea70-4740-9f7b-b15ba5535254
2e83ba6a-9778-4e84-80b2-168409debced	Advika	23r11a0515@gcet.edu.in	admin	2026-05-29 05:55:01.035892+00	\N	\N	\N	\N	2026-06-06 07:27:34.631303+00	Unknown	Unknown	0ee52668-ea70-4740-9f7b-b15ba5535254
595d5afb-c1f6-47a7-b92a-96519c1fc36f	Vaishnavi	23r11a0513@gcet.edu.in	student	2026-03-06 16:16:51.298508+00	\N	\N	\N	\N	2026-06-06 07:28:45.83821+00	Unknown	Unknown	0ee52668-ea70-4740-9f7b-b15ba5535254
ec79d798-6f6f-4549-8d79-edd15870b43b	lilly	23r11a0566@gcet.edu.in	student	2026-02-15 18:58:18.434703+00	\N	\N	\N	\N	2026-06-06 07:29:33.979739+00	Unknown	Unknown	0ee52668-ea70-4740-9f7b-b15ba5535254
b280f8c8-b05a-4237-b606-802420092eb1	Shasidhar reddy	23r11a67c7@gcet.edu.in	student	2026-02-14 05:26:30.861648+00	\N	\N	\N	\N	2026-05-28 07:20:16.196848+00	Unknown	Unknown	0ee52668-ea70-4740-9f7b-b15ba5535254
99abb06b-7974-45ae-887a-9a87e6ec9c36	siri	23r11a0512@gcet.edu.in	deptadmin	2026-03-06 16:05:35.02836+00	\N	\N	\N	c5bbdf77-79b5-4304-8fdc-59a4e87c2a53	2026-05-28 08:19:21.337855+00	Unknown	Unknown	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
ea5561b5-6918-4212-83d9-5e48dec790ce	Jay	23r11a0544@gcet.edu.in	admin	2026-02-10 15:03:19.438526+00	\N	\N	\N	\N	2026-06-06 07:33:49.001887+00	Unknown	Unknown	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
f6601227-10dc-4bb5-9be0-a48df646882c	Shivani	23r11a0505@gcet.edu.in	student	2026-03-10 04:36:59.156753+00	\N	\N	\N	\N	2026-05-10 10:51:08.142164+00	Unknown	Unknown	0ee52668-ea70-4740-9f7b-b15ba5535254
f6e82f04-701a-4e83-84a9-b311eaed6db2	Abhaya	21r11a05c0@gcet.edu.in	student	2026-04-16 16:03:43.238841+00	\N	\N	\N	\N	2026-05-10 10:51:08.142164+00	Unknown	Unknown	0ee52668-ea70-4740-9f7b-b15ba5535254
d1645cf0-5274-43f6-94d5-f0db4c6dcabf	abhiram	23r11a0511@gcet.edu.in	deptadmin	2026-03-03 08:24:42.139035+00	\N	\N	\N	c5bbdf77-79b5-4304-8fdc-59a4e87c2a53	2026-05-28 05:31:14.775118+00	Unknown	Unknown	0ee52668-ea70-4740-9f7b-b15ba5535254
b84fe995-c654-433b-949a-5d14b471481b	rishik	23r11a0546@gcet.edu.in	deptadmin	2026-03-03 08:25:15.226993+00	\N	\N	\N	186cc1c0-b797-40bf-b9d8-b8431531ecf3	2026-05-28 05:47:54.675883+00	Unknown	Unknown	0ee52668-ea70-4740-9f7b-b15ba5535254
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resources (id, title, description, file_url, file_type, section_key, updated_at, tenant_id) FROM stdin;
b41bf788-753c-4e97-a40e-83799f75f41b	Timeline PDF	Important dates and deadlines.	\N	PDF	timeline_pdf	2026-02-04 15:39:18.785222+00	0ee52668-ea70-4740-9f7b-b15ba5535254
b0117e1d-3787-40f8-9182-d74fc5dc5a51	Rules & Guidelines	Eligibility and submission rules.	\N	\N	rules_guidelines	2026-02-04 15:39:18.785222+00	0ee52668-ea70-4740-9f7b-b15ba5535254
0a347ec1-af3f-419b-9fbc-73d902aa5faf	PPT Template	Official presentation template	\N	\N	ppt_template	2026-02-11 05:41:49.084+00	0ee52668-ea70-4740-9f7b-b15ba5535254
f37bfdb9-4b82-4911-aea2-56e9bd8af9d4	Shortlist Excel	Official Excel Document	https://nducuwfztcjhelztdzbc.supabase.co/storage/v1/object/public/resources/shortlist_excel_1775894765880_24-3-26__1_.xlsx	24-3-26 (1).xlsx	shortlist_excel	2026-04-11 08:06:06.929+00	0ee52668-ea70-4740-9f7b-b15ba5535254
2bbb56bc-955a-4e99-a27b-0d66eebe09d7	VIT Rulebook	Official VIT Hackathon Rules.	\N	\N	vit-rules	2026-05-09 18:03:29.95091+00	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
96bc3066-6861-401b-b920-cdc2c7a72f93	VIT PPT Template	Pitch deck template for VIT participants.	\N	\N	vit-template	2026-05-09 18:03:29.95091+00	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
6fd8db9d-4400-4034-9074-70d5d2ff8d5d	PDF Template	Official document template	\N	\N	rules_guidelines__pdf_template	2026-05-28 14:48:08.68+00	0ee52668-ea70-4740-9f7b-b15ba5535254
\.


--
-- Data for Name: submission_batch_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.submission_batch_items (id, batch_id, problem_statement_id, created_at) FROM stdin;
\.


--
-- Data for Name: submission_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.submission_batches (id, department_id, submitted_by, status, cover_note, created_at, updated_at, submitted_at, tenant_id) FROM stdin;
2b64ba5f-828d-4605-8aea-ec554b06cbe6	\N	\N	submitted	\N	2026-02-13 05:55:04.401673+00	2026-05-29 05:53:36.617061+00	2026-02-13 05:55:04.401673+00	0ee52668-ea70-4740-9f7b-b15ba5535254
\.


--
-- Data for Name: team_registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_registrations (id, user_id, team_name, problem_id, member1_name, member1_roll, member2_name, member2_roll, member3_name, member3_roll, member4_name, member4_roll, member1_year, member1_department, member1_phone, member1_email, document_url, created_at, updated_at, document_filename, member3_year, member3_department, member3_phone, member3_email, member4_year, member4_department, member4_phone, member4_email, member2_year, member2_department, member2_phone, member2_email, tenant_id) FROM stdin;
3bd69129-c5dc-42b3-b52d-3513d05d5430	f6601227-10dc-4bb5-9be0-a48df646882c	team1	12345	member1	roll1	member2	roll2	\N	\N	\N	\N	3	EEE	8345242344	vivekvardhan310@gmail.com	\N	2026-05-28 07:17:19.074994+00	2026-05-28 07:17:19.074994+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	CSE	8765434565	vivekvardhan310@gmail.com	0ee52668-ea70-4740-9f7b-b15ba5535254
3d63178d-b03e-4980-a2c2-7fe73fb872d9	f6e82f04-701a-4e83-84a9-b311eaed6db2	Abhaya's Team	25010	Abhaya	21R11A05c0	Advika	23r11a0515@gcet.edu.in	\N	\N	\N	\N	4	CSE	9876543210	21r11a05c0@gcet.edu.in	f6e82f04-701a-4e83-84a9-b311eaed6db2_1779919707189_F_distributiin_table_0.01_level.pdf	2026-05-28 07:25:53.695708+00	2026-05-28 07:25:53.695708+00	F distributiin table 0.01 level.pdf	\N	\N	\N	\N	\N	\N	\N	\N	4	CSE	8765432190	23r11a0515@gcet.edu.in	0ee52668-ea70-4740-9f7b-b15ba5535254
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tenants (id, name, slug, created_at) FROM stdin;
0ee52668-ea70-4740-9f7b-b15ba5535254	GCET	gcet	2026-05-09 15:53:44.458829+00
472b9f7c-9f68-4ade-9b01-dbb969d2f4e6	VIT	vit	2026-05-09 17:54:54.067767+00
0ea0e008-8c3b-4570-ab6b-d36ab89565f9	Vagdevi	vgd	2026-05-25 16:57:01.945927+00
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.themes (id, name, tenant_id, created_at) FROM stdin;
41160002-d103-479e-bbb4-e09d013c0366	Community Innovation	0ee52668-ea70-4740-9f7b-b15ba5535254	2026-06-06 07:13:00.124586+00
2eca9e44-e38e-49f4-b9f7-6f7f4e935255	Academic	0ea0e008-8c3b-4570-ab6b-d36ab89565f9	2026-06-06 07:13:00.124586+00
9f9fb493-56a8-411e-9ff4-35eed7210d76	Non-Academic	0ea0e008-8c3b-4570-ab6b-d36ab89565f9	2026-06-06 07:13:00.124586+00
8650764d-cebd-448d-87fd-be5529a1510a	Non-Academic	0ee52668-ea70-4740-9f7b-b15ba5535254	2026-06-06 07:13:00.124586+00
8fd234cf-fd26-49c0-b180-114796c9d79f	Academic	0ee52668-ea70-4740-9f7b-b15ba5535254	2026-06-06 07:13:00.124586+00
3fa271b0-4f63-4866-9442-d8a60fff8fcc	Non-Academic	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6	2026-06-06 07:13:00.124586+00
30a9ede1-a7b5-4383-a3c2-9e22a0910cec	Community Innovation	0ea0e008-8c3b-4570-ab6b-d36ab89565f9	2026-06-06 07:13:00.124586+00
01c2ca90-896d-495c-bf89-066ace27c6d6	Smart Campus	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6	2026-06-06 07:13:00.124586+00
d2f22e60-c995-4ebe-bd60-84870ef7a07d	humangsour	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6	2026-06-06 07:46:36.964026+00
d59b2bba-f55d-4569-820a-b3e7454a95c0	xlr8	0ee52668-ea70-4740-9f7b-b15ba5535254	2026-06-06 07:48:15.287941+00
\.


--
-- Data for Name: user_queries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_queries (id, query_text, user_id, user_email, user_name, status, resolved_at, created_at, tenant_id) FROM stdin;
348d6f8f-581e-404a-a33e-335ce511a59e	Where can I download the pitch template?	\N	student2@example.com	Isha Kapoor	resolved	\N	2026-02-04 15:39:18.785222+00	0ee52668-ea70-4740-9f7b-b15ba5535254
e6134ae1-0295-4377-8b3d-96962afb203b	Can we update team members later?	\N	vivek@vit.ac.in	Vivek Vardhan	pending	\N	2026-05-09 18:03:29.95091+00	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (id, user_id, role, tenant_id) FROM stdin;
85431bdf-2b6b-418e-ae0c-5f98519cdae6	bc00594c-8776-4bef-9d32-cf6176f89f81	admin	0ee52668-ea70-4740-9f7b-b15ba5535254
842f30c3-6ae8-427b-bc42-5bf42e4334bc	ea5561b5-6918-4212-83d9-5e48dec790ce	admin	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
3b0973dc-105e-4223-b7d8-95ec46bfa24e	2e83ba6a-9778-4e84-80b2-168409debced	admin	0ea0e008-8c3b-4570-ab6b-d36ab89565f9
0f1dca9b-ac4e-43a8-983a-4ac84f0971ec	595d5afb-c1f6-47a7-b92a-96519c1fc36f	student	472b9f7c-9f68-4ade-9b01-dbb969d2f4e6
1c1ae2ca-188d-486b-af94-eca15c5f2089	ec79d798-6f6f-4549-8d79-edd15870b43b	student	0ea0e008-8c3b-4570-ab6b-d36ab89565f9
7c01eb6d-827a-419e-88db-296f1caede2e	b280f8c8-b05a-4237-b606-802420092eb1	student	0ee52668-ea70-4740-9f7b-b15ba5535254
e73cd2ad-f09a-4674-aab0-3e9fbe0e10ac	f6601227-10dc-4bb5-9be0-a48df646882c	student	0ee52668-ea70-4740-9f7b-b15ba5535254
2746488b-1053-4505-b296-06d27d350702	f6e82f04-701a-4e83-84a9-b311eaed6db2	student	0ee52668-ea70-4740-9f7b-b15ba5535254
72e1882c-18be-453f-bf40-5866cf968ab5	99abb06b-7974-45ae-887a-9a87e6ec9c36	deptadmin	0ee52668-ea70-4740-9f7b-b15ba5535254
031dbcc8-6653-41b8-bf1d-b7d4db2ee09d	d1645cf0-5274-43f6-94d5-f0db4c6dcabf	deptadmin	0ee52668-ea70-4740-9f7b-b15ba5535254
09dbea22-1bdc-4c6b-a992-317f37a8a17e	b84fe995-c654-433b-949a-5d14b471481b	deptadmin	0ee52668-ea70-4740-9f7b-b15ba5535254
\.


--
-- Data for Name: messages_2026_02_12; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_02_12 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_02_13; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_02_13 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_02_14; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_02_14 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_02_15; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_02_15 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: messages_2026_02_16; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_02_16 (topic, extension, payload, event, private, updated_at, inserted_at, id, binary_payload) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-12-23 08:05:56
20211116045059	2025-12-23 08:05:57
20211116050929	2025-12-23 08:05:58
20211116051442	2025-12-23 08:05:59
20211116212300	2025-12-23 08:06:00
20211116213355	2025-12-23 08:06:01
20211116213934	2025-12-23 08:06:02
20211116214523	2025-12-23 08:06:04
20211122062447	2025-12-23 08:06:04
20211124070109	2025-12-23 08:06:05
20211202204204	2025-12-23 08:06:06
20211202204605	2025-12-23 08:06:07
20211210212804	2025-12-23 08:06:10
20211228014915	2025-12-23 08:06:11
20220107221237	2025-12-23 08:06:12
20220228202821	2025-12-23 08:06:13
20220312004840	2025-12-23 08:06:14
20220603231003	2025-12-23 08:06:15
20220603232444	2025-12-23 08:06:16
20220615214548	2025-12-23 08:06:17
20220712093339	2025-12-23 08:06:18
20220908172859	2025-12-23 08:06:19
20220916233421	2025-12-23 08:06:20
20230119133233	2025-12-23 08:06:21
20230128025114	2025-12-23 08:06:22
20230128025212	2025-12-23 08:06:23
20230227211149	2025-12-23 08:06:24
20230228184745	2025-12-23 08:06:25
20230308225145	2025-12-23 08:06:26
20230328144023	2025-12-23 08:06:27
20231018144023	2025-12-23 08:06:28
20231204144023	2025-12-23 08:06:30
20231204144024	2025-12-23 08:06:30
20231204144025	2025-12-23 08:06:31
20240108234812	2025-12-23 08:06:32
20240109165339	2025-12-23 08:06:33
20240227174441	2025-12-23 08:06:35
20240311171622	2025-12-23 08:06:36
20240321100241	2025-12-23 08:06:38
20240401105812	2025-12-23 08:06:41
20240418121054	2025-12-23 08:06:42
20240523004032	2025-12-23 08:06:45
20240618124746	2025-12-23 08:06:46
20240801235015	2025-12-23 08:06:47
20240805133720	2025-12-23 08:06:48
20240827160934	2025-12-23 08:06:49
20240919163303	2025-12-23 08:06:50
20240919163305	2025-12-23 08:06:51
20241019105805	2025-12-23 08:06:52
20241030150047	2025-12-23 08:06:56
20241108114728	2025-12-23 08:06:57
20241121104152	2025-12-23 08:06:58
20241130184212	2025-12-23 08:06:59
20241220035512	2025-12-23 08:07:00
20241220123912	2025-12-23 08:07:01
20241224161212	2025-12-23 08:07:02
20250107150512	2025-12-23 08:07:03
20250110162412	2025-12-23 08:07:04
20250123174212	2025-12-23 08:07:05
20250128220012	2025-12-23 08:07:06
20250506224012	2025-12-23 08:07:06
20250523164012	2025-12-23 08:07:07
20250714121412	2025-12-23 08:07:08
20250905041441	2025-12-23 08:07:09
20251103001201	2025-12-23 08:07:10
20251120212548	2026-02-04 09:33:19
20251120215549	2026-02-04 09:33:19
20260218120000	2026-02-28 17:20:33
20260326120000	2026-04-13 06:48:24
20260514120000	2026-06-03 14:08:14
20260527120000	2026-06-03 14:08:14
20260528120000	2026-06-03 14:08:14
20260603120000	2026-06-06 06:29:39
20260605120000	2026-06-16 05:44:52
20260606110000	2026-06-16 05:44:52
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter, selected_columns) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
resources	resources	\N	2025-12-23 09:25:21.543655+00	2025-12-23 09:25:21.543655+00	t	f	\N	\N	\N	STANDARD
team-documents	team-documents	\N	2025-12-24 18:42:24.264131+00	2025-12-24 18:42:24.264131+00	t	f	\N	\N	\N	STANDARD
event_images	event_images	\N	2025-12-26 07:13:26.252541+00	2025-12-26 07:13:26.252541+00	t	f	\N	\N	\N	STANDARD
ps-documents	ps-documents	\N	2026-02-11 16:14:59.567938+00	2026-02-11 16:14:59.567938+00	f	f	10485760	{application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet}	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-12-23 08:05:55.023906
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-12-23 08:05:55.0376
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-12-23 08:05:55.077336
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-12-23 08:05:55.149327
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-12-23 08:05:55.152752
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-12-23 08:05:55.160218
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-12-23 08:05:55.163808
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-12-23 08:05:55.174378
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-12-23 08:05:55.178822
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-12-23 08:05:55.182613
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-12-23 08:05:55.186064
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-12-23 08:05:55.212899
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-12-23 08:05:55.216998
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-12-23 08:05:55.220312
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-12-23 08:05:55.223858
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-12-23 08:05:55.229694
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-12-23 08:05:55.234527
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-12-23 08:05:55.240237
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-12-23 08:05:55.253173
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-12-23 08:05:55.263867
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-12-23 08:05:55.268083
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-12-23 08:05:55.272182
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-12-23 08:05:57.074992
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2025-12-23 08:05:57.110486
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2025-12-23 08:05:57.114046
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2025-12-23 08:05:57.126194
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2025-12-23 08:05:57.130563
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2025-12-23 08:05:57.147661
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2025-12-23 08:05:55.042895
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2025-12-23 08:05:55.156639
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2025-12-23 08:05:55.166835
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2025-12-23 08:05:55.170545
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2025-12-23 08:05:55.275702
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2025-12-23 08:05:55.288292
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2025-12-23 08:05:55.815928
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2025-12-23 08:05:55.823487
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2025-12-23 08:05:55.829295
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2025-12-23 08:05:56.997221
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2025-12-23 08:05:57.04956
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2025-12-23 08:05:57.0565
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2025-12-23 08:05:57.058156
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2025-12-23 08:05:57.064102
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2025-12-23 08:05:57.067581
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2025-12-23 08:05:57.078713
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2025-12-23 08:05:57.087545
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2025-12-23 08:05:57.091454
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2025-12-23 08:05:57.098634
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2025-12-23 08:05:57.102512
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2025-12-23 08:05:57.107146
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2025-12-23 08:05:57.13379
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-02-10 14:48:47.235683
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-02-10 14:48:47.329899
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-02-10 14:48:47.331615
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-02-10 14:48:47.47861
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-02-10 14:48:47.481581
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-02-10 14:48:47.483215
57	s3-multipart-uploads-metadata	f127886e00d1b374fadbc7c6b31e09336aad5287	2026-04-09 12:56:15.499195
58	operation-ergonomics	00ca5d483b3fe0d522133d9002ccc5df98365120	2026-04-09 12:56:15.532965
56	fix-optimized-search-function	b823ed1e418101032fa01374edc9a436e54e3ed4	2026-02-10 14:48:47.495407
59	drop-unused-functions	38456f13e39691c2bbb4b5151d0d1cdbabd4a8c4	2026-05-06 11:37:34.466207
60	optimize-existing-functions-again	db35e1c91a9201e59f4fef8d972c2f277d68b157	2026-05-06 11:37:34.491561
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
1dc11386-7dfc-41ee-8858-0a6f12df6091	ps-documents	8f064c44-6ed2-479d-a547-d1beaf8d4a06/9ca4d9e1-c955-47a5-8872-bd4afe639630/1770962105788-letter (1).docx	8f064c44-6ed2-479d-a547-d1beaf8d4a06	2026-02-13 05:55:06.051967+00	2026-02-13 05:55:06.051967+00	2026-02-13 05:55:06.051967+00	{"eTag": "\\"db04e20137720a3366f0a470bc735ccb\\"", "size": 14468, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-02-13T05:55:07.000Z", "contentLength": 14468, "httpStatusCode": 200}	4e986af1-f20d-4fd1-a06c-cdf03d51b19b	8f064c44-6ed2-479d-a547-d1beaf8d4a06	{}
d4a19559-3932-4972-a33c-7e7dbda95d41	ps-documents	8f064c44-6ed2-479d-a547-d1beaf8d4a06/52ec1563-92bb-4642-8993-50a642e04375/1770962105790-letter (1).docx	8f064c44-6ed2-479d-a547-d1beaf8d4a06	2026-02-13 05:55:06.101977+00	2026-02-13 05:55:06.101977+00	2026-02-13 05:55:06.101977+00	{"eTag": "\\"db04e20137720a3366f0a470bc735ccb\\"", "size": 14468, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-02-13T05:55:07.000Z", "contentLength": 14468, "httpStatusCode": 200}	2e4e5b3c-ba35-4758-ac51-85a1e29ff0d0	8f064c44-6ed2-479d-a547-d1beaf8d4a06	{}
815e502e-9fdd-4610-b011-e6c7097e08b5	resources	about_cards/1779969857725_blue.webp	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-05-28 12:04:17.872951+00	2026-05-28 12:04:17.872951+00	2026-05-28 12:04:17.872951+00	{"eTag": "\\"038ee50ea18420f10fa63952b7dac42c\\"", "size": 6636, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-05-28T12:04:18.000Z", "contentLength": 6636, "httpStatusCode": 200}	1a6d5e94-d2bb-44c0-93f5-62ac7ca62296	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
86b4ef81-c5ef-4ab2-b706-db51f925cc62	event_images	event_1772441673812.png	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-03-02 08:54:32.21534+00	2026-03-02 08:54:32.21534+00	2026-03-02 08:54:32.21534+00	{"eTag": "\\"988445ab6be8b89b3768b770e8e4ab63\\"", "size": 1037364, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-03-02T08:54:33.000Z", "contentLength": 1037364, "httpStatusCode": 200}	ee4431d5-644a-4fe3-956e-58fb05235ead	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
3db70ba2-aee1-433f-9b6d-11a7f1eeb12b	resources	.emptyFolderPlaceholder	\N	2025-12-26 08:24:36.312642+00	2025-12-26 08:24:36.312642+00	2025-12-26 08:24:36.312642+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2025-12-26T08:24:36.303Z", "contentLength": 0, "httpStatusCode": 200}	0736994d-1b72-4fb7-9fbb-fe68269cd8ab	\N	{}
26ce3bd0-ac9e-420c-821c-5d95d4c2cf9d	event_images	event_1781554533004.png	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-06-16 07:59:04.5429+00	2026-06-16 07:59:04.5429+00	2026-06-16 07:59:04.5429+00	{"eTag": "\\"dce66d2e590268ed9ffb6bf30a03157b\\"", "size": 5061, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-06-16T07:59:05.000Z", "contentLength": 5061, "httpStatusCode": 200}	91f5baa4-c201-4dae-8b7f-dc089c47e668	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
d71548c8-e04f-45db-861a-7eb6bef72a08	event_images	.emptyFolderPlaceholder	\N	2025-12-26 08:39:12.892654+00	2025-12-26 08:39:12.892654+00	2025-12-26 08:39:12.892654+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2025-12-26T08:39:12.885Z", "contentLength": 0, "httpStatusCode": 200}	14fac6ab-6a28-41e3-bc61-faf57ef765a0	\N	{}
a17b9552-1ef9-43df-ac63-941f5915e06f	team-documents	.emptyFolderPlaceholder	\N	2025-12-26 11:17:38.033572+00	2025-12-26 11:17:38.033572+00	2025-12-26 11:17:38.033572+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2025-12-26T11:17:38.036Z", "contentLength": 0, "httpStatusCode": 200}	b5b4b55e-9689-4e44-9cc5-177c38892e62	\N	{}
2eed9cfb-65f1-4547-8d02-2d533e3bc247	event_images	event_1770222166836.png	de2f5cb1-c1cf-48c9-a2c4-0d7f6dd6373c	2026-02-04 16:22:49.055869+00	2026-02-04 16:22:49.055869+00	2026-02-04 16:22:49.055869+00	{"eTag": "\\"988445ab6be8b89b3768b770e8e4ab63\\"", "size": 1037364, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T16:22:49.000Z", "contentLength": 1037364, "httpStatusCode": 200}	8b91d685-0128-45cf-80b7-3877d2ddfb8a	de2f5cb1-c1cf-48c9-a2c4-0d7f6dd6373c	{}
710e0614-6e17-474f-9851-a219b43d3f60	event_images	event_1770222321163.png	de2f5cb1-c1cf-48c9-a2c4-0d7f6dd6373c	2026-02-04 16:25:22.617412+00	2026-02-04 16:25:22.617412+00	2026-02-04 16:25:22.617412+00	{"eTag": "\\"988445ab6be8b89b3768b770e8e4ab63\\"", "size": 1037364, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-04T16:25:23.000Z", "contentLength": 1037364, "httpStatusCode": 200}	5cd57df4-103e-43bf-8398-f1a052ac3ad5	de2f5cb1-c1cf-48c9-a2c4-0d7f6dd6373c	{}
f8d5114e-5160-4592-8d1f-076047dbda91	ps-documents	8f064c44-6ed2-479d-a547-d1beaf8d4a06/5c568dba-9547-4dad-a9c5-2812a42eeb9a/1770962105789-letter (1).docx	8f064c44-6ed2-479d-a547-d1beaf8d4a06	2026-02-13 05:55:06.048355+00	2026-02-13 05:55:06.048355+00	2026-02-13 05:55:06.048355+00	{"eTag": "\\"db04e20137720a3366f0a470bc735ccb\\"", "size": 14468, "mimetype": "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "cacheControl": "max-age=3600", "lastModified": "2026-02-13T05:55:07.000Z", "contentLength": 14468, "httpStatusCode": 200}	869893bc-6a97-4742-8907-b9a7be7c94cd	8f064c44-6ed2-479d-a547-d1beaf8d4a06	{}
9d546054-e146-400b-b4c9-9529ed40fb84	resources	home_timeline_header/.emptyFolderPlaceholder	\N	2026-05-28 12:09:07.851734+00	2026-05-28 12:09:07.851734+00	2026-05-28 12:09:07.851734+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2026-05-28T12:09:07.842Z", "contentLength": 0, "httpStatusCode": 200}	5a0d5b2f-c9f8-4545-bde0-ef9f785c75cd	\N	{}
9944acb1-44bb-4b05-922f-c8c64bc61f08	resources	home_hero_images/1781727387309-1.png	bc00594c-8776-4bef-9d32-cf6176f89f81	2026-06-18 06:29:49.340133+00	2026-06-18 06:29:49.340133+00	2026-06-18 06:29:49.340133+00	{"eTag": "\\"723bf3df892b0b28d722a72646a57e9f\\"", "size": 12778, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-06-18T06:29:50.000Z", "contentLength": 12778, "httpStatusCode": 200}	e508704d-65da-441e-88a7-220a09f8209c	bc00594c-8776-4bef-9d32-cf6176f89f81	{}
b3e01312-38f0-4b66-874d-d4db54d5ea25	resources	about_cards/.emptyFolderPlaceholder	\N	2026-05-25 07:23:19.31332+00	2026-05-25 07:23:19.31332+00	2026-05-25 07:23:19.31332+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2026-05-25T07:23:19.316Z", "contentLength": 0, "httpStatusCode": 200}	bdc5d70e-6f03-454e-ae25-d3c49a55df82	\N	{}
c4f2cb9c-4f02-417e-80ee-5ee4e833969c	event_images	event_1779904352393.png	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-05-27 17:52:34.086789+00	2026-05-27 17:52:34.086789+00	2026-05-27 17:52:34.086789+00	{"eTag": "\\"2ec93adf606b53f2d16676d14d1e2008\\"", "size": 1265679, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-05-27T17:52:35.000Z", "contentLength": 1265679, "httpStatusCode": 200}	f53f7323-6b60-41e0-beb6-f4a508ecb77b	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
aaa9937c-da65-48f5-b8e5-b934de2bfdb0	resources	home_timeline_images/1779949980574_0_20240302_111524.jpg	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-05-28 06:33:01.639551+00	2026-05-28 06:33:01.639551+00	2026-05-28 06:33:01.639551+00	{"eTag": "\\"d9d5ee11207489acab077ad462bd9602-2\\"", "size": 7844607, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-05-28T06:33:02.000Z", "contentLength": 7844607, "httpStatusCode": 200}	2307aea6-5dd8-4a7d-9efc-e1453396d2c7	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
b963c8cb-61f3-4cca-8531-155cfa5dc8f2	event_images	event_1770789888356.png	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-02-11 06:04:55.405127+00	2026-02-11 06:04:55.405127+00	2026-02-11 06:04:55.405127+00	{"eTag": "\\"dea778f1645263899bbea196a59a62bd\\"", "size": 583398, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-02-11T06:04:56.000Z", "contentLength": 583398, "httpStatusCode": 200}	34333937-5dbe-47f5-a609-2b2166c711b9	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
dcabba5f-9388-4250-907b-d72a776a633b	resources	home_slider_images/1779534895422-blue.webp	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-05-23 11:14:56.20166+00	2026-05-23 11:14:56.20166+00	2026-05-23 11:14:56.20166+00	{"eTag": "\\"038ee50ea18420f10fa63952b7dac42c\\"", "size": 6636, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-05-23T11:14:57.000Z", "contentLength": 6636, "httpStatusCode": 200}	590ab931-741a-4b94-83ae-791641353b34	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
6fab4716-dc97-4445-8024-2322e654a3ae	event_images	event_1779905902167.webp	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-05-27 18:18:22.374601+00	2026-05-27 18:18:22.374601+00	2026-05-27 18:18:22.374601+00	{"eTag": "\\"038ee50ea18420f10fa63952b7dac42c\\"", "size": 6636, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-05-27T18:18:23.000Z", "contentLength": 6636, "httpStatusCode": 200}	66c67bb8-33be-44bf-8e77-6940297d57f0	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
77072396-4499-4c86-a516-25177513e44f	event_images	event_1779906158133.webp	8f064c44-6ed2-479d-a547-d1beaf8d4a06	2026-05-27 18:22:38.500684+00	2026-05-27 18:22:38.500684+00	2026-05-27 18:22:38.500684+00	{"eTag": "\\"038ee50ea18420f10fa63952b7dac42c\\"", "size": 6636, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-05-27T18:22:39.000Z", "contentLength": 6636, "httpStatusCode": 200}	267131e2-55a8-42a5-abac-7f8599eeb0f1	8f064c44-6ed2-479d-a547-d1beaf8d4a06	{}
76fb0037-e0e7-46da-9556-978f36d88323	team-documents	f6e82f04-701a-4e83-84a9-b311eaed6db2_1779919707189_F_distributiin_table_0.01_level.pdf	f6e82f04-701a-4e83-84a9-b311eaed6db2	2026-05-28 07:25:53.479531+00	2026-05-28 07:25:53.479531+00	2026-05-28 07:25:53.479531+00	{"eTag": "\\"36d5308920096a27ce555f9f1519714f\\"", "size": 1670747, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2026-05-28T07:25:54.000Z", "contentLength": 1670747, "httpStatusCode": 200}	95b187e3-3640-4589-b51a-b9365ecae39a	f6e82f04-701a-4e83-84a9-b311eaed6db2	{}
46789e5b-3148-4825-9d29-9ce1af45240f	resources	home_timeline_icons/.emptyFolderPlaceholder	\N	2026-05-28 11:44:01.02444+00	2026-05-28 11:44:01.02444+00	2026-05-28 11:44:01.02444+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2026-05-28T11:44:01.014Z", "contentLength": 0, "httpStatusCode": 200}	984d648e-b234-4e33-9e7d-d9dcd0f8fbd7	\N	{}
f96f012a-02bc-4ac6-a1b9-bf629145137c	resources	home_timeline_images/1780039084760_0_SwimLane.png	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-05-29 07:18:28.272907+00	2026-05-29 07:18:28.272907+00	2026-05-29 07:18:28.272907+00	{"eTag": "\\"222282675691770c021fb8b6f5823f43\\"", "size": 22936, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-05-29T07:18:29.000Z", "contentLength": 22936, "httpStatusCode": 200}	5b4ea0c0-44fa-4606-a0ff-fd99db56e0cb	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
e4a55a96-f5cb-4dd0-a4f5-60092ed29f42	team-documents	d0162e3c-be25-43b0-8e46-9a744f221149_1772884685613_Software_Engineering_Lab_1_.pptx	d0162e3c-be25-43b0-8e46-9a744f221149	2026-03-07 11:58:06.550174+00	2026-03-07 11:58:06.550174+00	2026-03-07 11:58:06.550174+00	{"eTag": "\\"71b154f41b0fcfb388f75614fdb4742b\\"", "size": 2747399, "mimetype": "application/vnd.openxmlformats-officedocument.presentationml.presentation", "cacheControl": "max-age=3600", "lastModified": "2026-03-07T11:58:07.000Z", "contentLength": 2747399, "httpStatusCode": 200}	469fe154-546e-4629-85e9-5421f0b12ede	d0162e3c-be25-43b0-8e46-9a744f221149	{}
0d37d7e4-6250-449e-b64d-28afe739ce9f	resources	home_timeline_header/1780039175531_0_29thAugAgenda.jpg	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-05-29 07:19:58.570508+00	2026-05-29 07:19:58.570508+00	2026-05-29 07:19:58.570508+00	{"eTag": "\\"211ad5ee608e173d45681e92d7d27b61\\"", "size": 140592, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-05-29T07:19:59.000Z", "contentLength": 140592, "httpStatusCode": 200}	e02bd43e-d3a6-4045-9e0b-1d0b0603a18d	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
20e625b0-f1b0-4935-8147-a5f00ceeedbd	resources	about_cards/1780039224820_mukesh_kestwal.jpeg	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-05-29 07:20:48.143347+00	2026-05-29 07:20:48.143347+00	2026-05-29 07:20:48.143347+00	{"eTag": "\\"fb3ac0a4240e387ede6e653f7ffe9bdb\\"", "size": 10077, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-05-29T07:20:49.000Z", "contentLength": 10077, "httpStatusCode": 200}	4220b790-f5c9-4230-9fc6-31d6d7e01c96	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
ae876233-7eb7-4cd7-ab7b-ca62197a0d2d	resources	shortlist_excel_1775894765880_24-3-26__1_.xlsx	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-04-11 08:06:07.073875+00	2026-04-11 08:06:07.073875+00	2026-04-11 08:06:07.073875+00	{"eTag": "\\"f2792c6f356dc8864cbc2888e4ef3053\\"", "size": 103282, "mimetype": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "cacheControl": "max-age=3600", "lastModified": "2026-04-11T08:06:08.000Z", "contentLength": 103282, "httpStatusCode": 200}	5754c128-082a-452f-8499-a2f107aa3e47	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
23348825-0767-482e-81f3-650d4768df4b	event_images	event_1779894563476.png	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-05-27 15:09:25.150531+00	2026-05-27 15:09:25.150531+00	2026-05-27 15:09:25.150531+00	{"eTag": "\\"2ec93adf606b53f2d16676d14d1e2008\\"", "size": 1265679, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-05-27T15:09:26.000Z", "contentLength": 1265679, "httpStatusCode": 200}	634ae6e3-797c-469e-9a95-ee801f0c49b4	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
9e1e0a97-764c-4fcb-88b6-191e3d0288f5	event_images	event_1779894767938.webp	ea5561b5-6918-4212-83d9-5e48dec790ce	2026-05-27 15:12:49.51457+00	2026-05-27 15:12:49.51457+00	2026-05-27 15:12:49.51457+00	{"eTag": "\\"038ee50ea18420f10fa63952b7dac42c\\"", "size": 6636, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2026-05-27T15:12:50.000Z", "contentLength": 6636, "httpStatusCode": 200}	c5ea3236-a487-49e4-8049-11bd43587e41	ea5561b5-6918-4212-83d9-5e48dec790ce	{}
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata, metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.schema_migrations (version, statements, name) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1096, true);


--
-- Name: jobid_seq; Type: SEQUENCE SET; Schema: cron; Owner: supabase_admin
--

SELECT pg_catalog.setval('cron.jobid_seq', 1, true);


--
-- Name: runid_seq; Type: SEQUENCE SET; Schema: cron; Owner: supabase_admin
--

SELECT pg_catalog.setval('cron.runid_seq', 21, true);


--
-- Name: problem_statement_remarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.problem_statement_remarks_id_seq', 872, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webauthn_challenges webauthn_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_pkey PRIMARY KEY (id);


--
-- Name: webauthn_credentials webauthn_credentials_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_pkey PRIMARY KEY (id);


--
-- Name: contest_settings contest_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_settings
    ADD CONSTRAINT contest_settings_pkey PRIMARY KEY (id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: event_registrations event_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_registrations
    ADD CONSTRAINT event_registrations_pkey PRIMARY KEY (id);


--
-- Name: events_archive events_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_archive
    ADD CONSTRAINT events_archive_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: page_content page_content_page_name_section_key_tenant_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_content
    ADD CONSTRAINT page_content_page_name_section_key_tenant_id_key UNIQUE (page_name, section_key, tenant_id);


--
-- Name: page_content page_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_content
    ADD CONSTRAINT page_content_pkey PRIMARY KEY (id);


--
-- Name: problem_statement_alerts problem_statement_alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_alerts
    ADD CONSTRAINT problem_statement_alerts_pkey PRIMARY KEY (id);


--
-- Name: problem_statement_alerts problem_statement_alerts_priority_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_statement_alerts
    ADD CONSTRAINT problem_statement_alerts_priority_check CHECK ((priority = ANY (ARRAY['high'::text, 'medium'::text, 'low'::text]))) NOT VALID;


--
-- Name: problem_statement_alerts problem_statement_alerts_type_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_statement_alerts
    ADD CONSTRAINT problem_statement_alerts_type_check CHECK ((type = ANY (ARRAY['overdue'::text, 'reminder'::text, 'message'::text, 'approval'::text]))) NOT VALID;


--
-- Name: problem_statement_attachments problem_statement_attachments_object_path_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_attachments
    ADD CONSTRAINT problem_statement_attachments_object_path_key UNIQUE (object_path);


--
-- Name: problem_statement_attachments problem_statement_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_attachments
    ADD CONSTRAINT problem_statement_attachments_pkey PRIMARY KEY (id);


--
-- Name: problem_statement_messages problem_statement_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_messages
    ADD CONSTRAINT problem_statement_messages_pkey PRIMARY KEY (id);


--
-- Name: problem_statement_remarks problem_statement_remarks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_remarks
    ADD CONSTRAINT problem_statement_remarks_pkey PRIMARY KEY (id);


--
-- Name: problem_statement_reviews problem_statement_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_reviews
    ADD CONSTRAINT problem_statement_reviews_pkey PRIMARY KEY (id);


--
-- Name: problem_statement_reviews problem_statement_reviews_recommended_status_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_statement_reviews
    ADD CONSTRAINT problem_statement_reviews_recommended_status_check CHECK ((recommended_status = ANY (ARRAY['pending_review'::text, 'approved'::text, 'revision_needed'::text]))) NOT VALID;


--
-- Name: problem_statements problem_statements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statements
    ADD CONSTRAINT problem_statements_pkey PRIMARY KEY (id);


--
-- Name: problem_statements problem_statements_problem_statement_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statements
    ADD CONSTRAINT problem_statements_problem_statement_id_key UNIQUE (problem_statement_id);


--
-- Name: problem_statements problem_statements_status_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_statements
    ADD CONSTRAINT problem_statements_status_check CHECK ((status = ANY (ARRAY['draft'::text, 'submitted'::text, 'pending_review'::text, 'approved'::text, 'revision_needed'::text]))) NOT VALID;


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: resources resources_section_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_section_key_key UNIQUE (section_key);


--
-- Name: submission_batch_items submission_batch_items_batch_id_problem_statement_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submission_batch_items
    ADD CONSTRAINT submission_batch_items_batch_id_problem_statement_id_key UNIQUE (batch_id, problem_statement_id);


--
-- Name: submission_batch_items submission_batch_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submission_batch_items
    ADD CONSTRAINT submission_batch_items_pkey PRIMARY KEY (id);


--
-- Name: submission_batches submission_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submission_batches
    ADD CONSTRAINT submission_batches_pkey PRIMARY KEY (id);


--
-- Name: submission_batches submission_batches_status_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.submission_batches
    ADD CONSTRAINT submission_batches_status_check CHECK ((status = ANY (ARRAY['submitted'::text, 'under_review'::text, 'closed'::text]))) NOT VALID;


--
-- Name: team_registrations team_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_registrations
    ADD CONSTRAINT team_registrations_pkey PRIMARY KEY (id);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: tenants tenants_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_slug_key UNIQUE (slug);


--
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: problem_statement_remarks unique_problem_remark; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_remarks
    ADD CONSTRAINT unique_problem_remark UNIQUE (problem_statement_id);


--
-- Name: user_queries user_queries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_queries
    ADD CONSTRAINT user_queries_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_key UNIQUE (user_id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_02_12 messages_2026_02_12_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_02_12
    ADD CONSTRAINT messages_2026_02_12_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_02_13 messages_2026_02_13_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_02_13
    ADD CONSTRAINT messages_2026_02_13_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_02_14 messages_2026_02_14_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_02_14
    ADD CONSTRAINT messages_2026_02_14_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_02_15 messages_2026_02_15_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_02_15
    ADD CONSTRAINT messages_2026_02_15_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_02_16 messages_2026_02_16_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_02_16
    ADD CONSTRAINT messages_2026_02_16_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages messages_payload_exclusive; Type: CHECK CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages
    ADD CONSTRAINT messages_payload_exclusive CHECK (((payload IS NULL) OR (binary_payload IS NULL))) NOT VALID;


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: webauthn_challenges_expires_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_expires_at_idx ON auth.webauthn_challenges USING btree (expires_at);


--
-- Name: webauthn_challenges_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_challenges_user_id_idx ON auth.webauthn_challenges USING btree (user_id);


--
-- Name: webauthn_credentials_credential_id_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX webauthn_credentials_credential_id_key ON auth.webauthn_credentials USING btree (credential_id);


--
-- Name: webauthn_credentials_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX webauthn_credentials_user_id_idx ON auth.webauthn_credentials USING btree (user_id);


--
-- Name: idx_contest_settings_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contest_settings_tenant_id ON public.contest_settings USING btree (tenant_id);


--
-- Name: idx_event_registrations_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_event_registrations_event_id ON public.event_registrations USING btree (event_id);


--
-- Name: idx_event_registrations_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_event_registrations_user_id ON public.event_registrations USING btree (user_id);


--
-- Name: idx_page_content_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_page_content_tenant_id ON public.page_content USING btree (tenant_id);


--
-- Name: idx_problem_statement_alerts_recipient; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_statement_alerts_recipient ON public.problem_statement_alerts USING btree (recipient_user_id, is_read, created_at DESC);


--
-- Name: idx_problem_statement_attachments_ps; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_statement_attachments_ps ON public.problem_statement_attachments USING btree (problem_statement_id);


--
-- Name: idx_problem_statement_messages_ps; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_statement_messages_ps ON public.problem_statement_messages USING btree (problem_statement_id, created_at DESC);


--
-- Name: idx_problem_statement_reviews_ps; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_statement_reviews_ps ON public.problem_statement_reviews USING btree (problem_statement_id, created_at DESC);


--
-- Name: idx_problem_statements_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_statements_created_by ON public.problem_statements USING btree (created_by);


--
-- Name: idx_problem_statements_department_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_statements_department_status ON public.problem_statements USING btree (department_id, status);


--
-- Name: idx_problem_statements_last_updated; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_statements_last_updated ON public.problem_statements USING btree (last_updated DESC);


--
-- Name: idx_problem_statements_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_statements_status ON public.problem_statements USING btree (status);


--
-- Name: idx_problem_statements_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_problem_statements_tenant_id ON public.problem_statements USING btree (tenant_id);


--
-- Name: idx_profiles_department_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_profiles_department_id ON public.profiles USING btree (department_id);


--
-- Name: idx_profiles_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_profiles_tenant_id ON public.profiles USING btree (tenant_id);


--
-- Name: idx_ps_alerts_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ps_alerts_tenant_id ON public.problem_statement_alerts USING btree (tenant_id);


--
-- Name: idx_ps_attachments_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ps_attachments_tenant_id ON public.problem_statement_attachments USING btree (tenant_id);


--
-- Name: idx_ps_messages_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ps_messages_tenant_id ON public.problem_statement_messages USING btree (tenant_id);


--
-- Name: idx_ps_remarks_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ps_remarks_tenant_id ON public.problem_statement_remarks USING btree (tenant_id);


--
-- Name: idx_submission_batch_items_ps; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_submission_batch_items_ps ON public.submission_batch_items USING btree (problem_statement_id);


--
-- Name: idx_submission_batches_department_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_submission_batches_department_id ON public.submission_batches USING btree (department_id);


--
-- Name: idx_submission_batches_submitted_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_submission_batches_submitted_by ON public.submission_batches USING btree (submitted_by);


--
-- Name: idx_team_registrations_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_team_registrations_tenant_id ON public.team_registrations USING btree (tenant_id);


--
-- Name: idx_team_registrations_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_team_registrations_user_id ON public.team_registrations USING btree (user_id);


--
-- Name: idx_user_queries_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_queries_user_id ON public.user_queries USING btree (user_id);


--
-- Name: idx_user_roles_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_roles_tenant_id ON public.user_roles USING btree (tenant_id);


--
-- Name: idx_user_roles_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_roles_user_id ON public.user_roles USING btree (user_id);


--
-- Name: team_registrations_team_name_lower_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX team_registrations_team_name_lower_unique ON public.team_registrations USING btree (lower(TRIM(BOTH FROM team_name)));


--
-- Name: themes_tenant_name_lower_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX themes_tenant_name_lower_idx ON public.themes USING btree (tenant_id, lower(name));


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_02_12_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_02_12_inserted_at_topic_idx ON realtime.messages_2026_02_12 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_02_13_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_02_13_inserted_at_topic_idx ON realtime.messages_2026_02_13 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_02_14_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_02_14_inserted_at_topic_idx ON realtime.messages_2026_02_14 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_02_15_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_02_15_inserted_at_topic_idx ON realtime.messages_2026_02_15 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_02_16_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_02_16_inserted_at_topic_idx ON realtime.messages_2026_02_16 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_selec; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_selec ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter, COALESCE(selected_columns, '{}'::text[]));


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name_lower ON storage.objects USING btree (bucket_id, lower(name) COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: messages_2026_02_12_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_02_12_inserted_at_topic_idx;


--
-- Name: messages_2026_02_12_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_02_12_pkey;


--
-- Name: messages_2026_02_13_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_02_13_inserted_at_topic_idx;


--
-- Name: messages_2026_02_13_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_02_13_pkey;


--
-- Name: messages_2026_02_14_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_02_14_inserted_at_topic_idx;


--
-- Name: messages_2026_02_14_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_02_14_pkey;


--
-- Name: messages_2026_02_15_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_02_15_inserted_at_topic_idx;


--
-- Name: messages_2026_02_15_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_02_15_pkey;


--
-- Name: messages_2026_02_16_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_02_16_inserted_at_topic_idx;


--
-- Name: messages_2026_02_16_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_02_16_pkey;


--
-- Name: users on_auth_user_created; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


--
-- Name: team_registrations on_team_registration_insert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER on_team_registration_insert AFTER INSERT ON public.team_registrations FOR EACH ROW EXECUTE FUNCTION public.handle_new_team_registration();


--
-- Name: themes themes_prevent_delete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER themes_prevent_delete BEFORE DELETE ON public.themes FOR EACH ROW EXECUTE FUNCTION public.prevent_theme_delete();


--
-- Name: departments trg_departments_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_departments_updated_at BEFORE UPDATE ON public.departments FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: problem_statement_reviews trg_problem_statement_reviews_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_problem_statement_reviews_updated_at BEFORE UPDATE ON public.problem_statement_reviews FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: problem_statements trg_problem_statements_set_defaults; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_problem_statements_set_defaults BEFORE INSERT ON public.problem_statements FOR EACH ROW EXECUTE FUNCTION public.problem_statements_set_defaults();


--
-- Name: profiles trg_profiles_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_profiles_updated_at BEFORE UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: submission_batches trg_submission_batches_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_submission_batches_updated_at BEFORE UPDATE ON public.submission_batches FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: user_roles trg_sync_profile_role; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_sync_profile_role AFTER INSERT OR UPDATE ON public.user_roles FOR EACH ROW EXECUTE FUNCTION public.sync_profile_role();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: webauthn_challenges webauthn_challenges_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: webauthn_credentials webauthn_credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: contest_settings contest_settings_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contest_settings
    ADD CONSTRAINT contest_settings_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: event_registrations event_registrations_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_registrations
    ADD CONSTRAINT event_registrations_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- Name: event_registrations event_registrations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_registrations
    ADD CONSTRAINT event_registrations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: events events_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id);


--
-- Name: page_content page_content_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.page_content
    ADD CONSTRAINT page_content_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: problem_statement_alerts problem_statement_alerts_problem_statement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_alerts
    ADD CONSTRAINT problem_statement_alerts_problem_statement_id_fkey FOREIGN KEY (problem_statement_id) REFERENCES public.problem_statements(id) ON DELETE CASCADE;


--
-- Name: problem_statement_alerts problem_statement_alerts_recipient_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_alerts
    ADD CONSTRAINT problem_statement_alerts_recipient_user_id_fkey FOREIGN KEY (recipient_user_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: problem_statement_attachments problem_statement_attachments_problem_statement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_attachments
    ADD CONSTRAINT problem_statement_attachments_problem_statement_id_fkey FOREIGN KEY (problem_statement_id) REFERENCES public.problem_statements(id) ON DELETE CASCADE;


--
-- Name: problem_statement_attachments problem_statement_attachments_uploaded_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_attachments
    ADD CONSTRAINT problem_statement_attachments_uploaded_by_fkey FOREIGN KEY (uploaded_by) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- Name: problem_statement_messages problem_statement_messages_problem_statement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_messages
    ADD CONSTRAINT problem_statement_messages_problem_statement_id_fkey FOREIGN KEY (problem_statement_id) REFERENCES public.problem_statements(id) ON DELETE CASCADE;


--
-- Name: problem_statement_messages problem_statement_messages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_messages
    ADD CONSTRAINT problem_statement_messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- Name: problem_statement_remarks problem_statement_remarks_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_remarks
    ADD CONSTRAINT problem_statement_remarks_author_id_fkey FOREIGN KEY (author_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: problem_statement_remarks problem_statement_remarks_problem_statement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_remarks
    ADD CONSTRAINT problem_statement_remarks_problem_statement_id_fkey FOREIGN KEY (problem_statement_id) REFERENCES public.problem_statements(id) ON DELETE CASCADE;


--
-- Name: problem_statement_reviews problem_statement_reviews_problem_statement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_reviews
    ADD CONSTRAINT problem_statement_reviews_problem_statement_id_fkey FOREIGN KEY (problem_statement_id) REFERENCES public.problem_statements(id) ON DELETE CASCADE;


--
-- Name: problem_statement_reviews problem_statement_reviews_reviewer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_reviews
    ADD CONSTRAINT problem_statement_reviews_reviewer_id_fkey FOREIGN KEY (reviewer_id) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- Name: problem_statements problem_statements_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statements
    ADD CONSTRAINT problem_statements_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- Name: problem_statements problem_statements_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statements
    ADD CONSTRAINT problem_statements_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id) ON DELETE SET NULL;


--
-- Name: problem_statements problem_statements_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statements
    ADD CONSTRAINT problem_statements_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- Name: problem_statements problem_statements_submission_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statements
    ADD CONSTRAINT problem_statements_submission_batch_id_fkey FOREIGN KEY (submission_batch_id) REFERENCES public.submission_batches(id) ON DELETE SET NULL;


--
-- Name: problem_statements problem_statements_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statements
    ADD CONSTRAINT problem_statements_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id);


--
-- Name: profiles profiles_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id) ON DELETE SET NULL;


--
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: profiles profiles_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id);


--
-- Name: problem_statement_alerts ps_alerts_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_alerts
    ADD CONSTRAINT ps_alerts_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: problem_statement_attachments ps_attachments_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_attachments
    ADD CONSTRAINT ps_attachments_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: problem_statement_messages ps_messages_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_messages
    ADD CONSTRAINT ps_messages_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: problem_statement_remarks ps_remarks_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problem_statement_remarks
    ADD CONSTRAINT ps_remarks_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: resources resources_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id);


--
-- Name: submission_batch_items submission_batch_items_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submission_batch_items
    ADD CONSTRAINT submission_batch_items_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.submission_batches(id) ON DELETE CASCADE;


--
-- Name: submission_batch_items submission_batch_items_problem_statement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submission_batch_items
    ADD CONSTRAINT submission_batch_items_problem_statement_id_fkey FOREIGN KEY (problem_statement_id) REFERENCES public.problem_statements(id) ON DELETE CASCADE;


--
-- Name: submission_batches submission_batches_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submission_batches
    ADD CONSTRAINT submission_batches_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id) ON DELETE SET NULL;


--
-- Name: submission_batches submission_batches_submitted_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submission_batches
    ADD CONSTRAINT submission_batches_submitted_by_fkey FOREIGN KEY (submitted_by) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- Name: submission_batches submission_batches_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submission_batches
    ADD CONSTRAINT submission_batches_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id);


--
-- Name: team_registrations team_registrations_problem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_registrations
    ADD CONSTRAINT team_registrations_problem_id_fkey FOREIGN KEY (problem_id) REFERENCES public.problem_statements(problem_statement_id);


--
-- Name: team_registrations team_registrations_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_registrations
    ADD CONSTRAINT team_registrations_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id);


--
-- Name: team_registrations team_registrations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_registrations
    ADD CONSTRAINT team_registrations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: user_queries user_queries_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_queries
    ADD CONSTRAINT user_queries_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id);


--
-- Name: user_queries user_queries_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_queries
    ADD CONSTRAINT user_queries_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- Name: user_roles user_roles_tenant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: departments Admins can manage departments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can manage departments" ON public.departments TO authenticated USING (public.is_admin_user()) WITH CHECK (public.is_admin_user());


--
-- Name: departments Anyone can view departments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can view departments" ON public.departments FOR SELECT USING (true);


--
-- Name: tenants Public can read tenants; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public can read tenants" ON public.tenants FOR SELECT TO anon USING (true);


--
-- Name: problem_statements anon can read approved tenant problem statements; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "anon can read approved tenant problem statements" ON public.problem_statements FOR SELECT TO anon USING (((tenant_id IS NOT NULL) AND (status = 'approved'::text)));


--
-- Name: contest_settings anon can read tenant contest settings; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "anon can read tenant contest settings" ON public.contest_settings FOR SELECT TO anon USING ((tenant_id IS NOT NULL));


--
-- Name: events anon can read tenant events; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "anon can read tenant events" ON public.events FOR SELECT TO anon USING ((tenant_id IS NOT NULL));


--
-- Name: page_content anon can read tenant page content; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "anon can read tenant page content" ON public.page_content FOR SELECT TO anon USING ((tenant_id IS NOT NULL));


--
-- Name: resources anon can read tenant resources; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "anon can read tenant resources" ON public.resources FOR SELECT TO anon USING ((tenant_id IS NOT NULL));


--
-- Name: user_queries anon can submit tenant queries; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "anon can submit tenant queries" ON public.user_queries FOR INSERT TO anon WITH CHECK (((tenant_id IS NOT NULL) AND (user_id IS NULL) AND (user_email IS NOT NULL) AND (length(TRIM(BOTH FROM user_email)) > 0)));


--
-- Name: contest_settings authenticated can read own tenant contest settings; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "authenticated can read own tenant contest settings" ON public.contest_settings FOR SELECT TO authenticated USING (public.same_tenant(tenant_id));


--
-- Name: events authenticated can read own tenant events; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "authenticated can read own tenant events" ON public.events FOR SELECT TO authenticated USING (public.same_tenant(tenant_id));


--
-- Name: page_content authenticated can read own tenant page content; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "authenticated can read own tenant page content" ON public.page_content FOR SELECT TO authenticated USING (public.same_tenant(tenant_id));


--
-- Name: problem_statements authenticated can read own tenant problem statements; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "authenticated can read own tenant problem statements" ON public.problem_statements FOR SELECT TO authenticated USING ((public.same_tenant(tenant_id) AND ((status = 'approved'::text) OR (created_by = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id))));


--
-- Name: resources authenticated can read own tenant resources; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "authenticated can read own tenant resources" ON public.resources FOR SELECT TO authenticated USING (public.same_tenant(tenant_id));


--
-- Name: contest_settings; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.contest_settings ENABLE ROW LEVEL SECURITY;

--
-- Name: departments; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.departments ENABLE ROW LEVEL SECURITY;

--
-- Name: event_registrations; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.event_registrations ENABLE ROW LEVEL SECURITY;

--
-- Name: events; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.events ENABLE ROW LEVEL SECURITY;

--
-- Name: events_archive; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.events_archive ENABLE ROW LEVEL SECURITY;

--
-- Name: page_content; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.page_content ENABLE ROW LEVEL SECURITY;

--
-- Name: problem_statement_alerts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_statement_alerts ENABLE ROW LEVEL SECURITY;

--
-- Name: problem_statement_attachments; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_statement_attachments ENABLE ROW LEVEL SECURITY;

--
-- Name: problem_statement_messages; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_statement_messages ENABLE ROW LEVEL SECURITY;

--
-- Name: problem_statement_remarks; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_statement_remarks ENABLE ROW LEVEL SECURITY;

--
-- Name: problem_statement_reviews; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_statement_reviews ENABLE ROW LEVEL SECURITY;

--
-- Name: problem_statements; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.problem_statements ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: tenants public can read tenant slugs; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "public can read tenant slugs" ON public.tenants FOR SELECT TO authenticated, anon USING (true);


--
-- Name: resources; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.resources ENABLE ROW LEVEL SECURITY;

--
-- Name: problem_statements same tenant admins can delete problem statements; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "same tenant admins can delete problem statements" ON public.problem_statements FOR DELETE TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id)));


--
-- Name: problem_statement_alerts same tenant can access alerts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "same tenant can access alerts" ON public.problem_statement_alerts TO authenticated USING ((public.same_tenant(tenant_id) AND ((recipient_user_id = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id)))) WITH CHECK ((public.same_tenant(tenant_id) AND ((recipient_user_id = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id))));


--
-- Name: problem_statement_attachments same tenant can access attachments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "same tenant can access attachments" ON public.problem_statement_attachments TO authenticated USING ((public.same_tenant(tenant_id) AND ((uploaded_by = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id)))) WITH CHECK ((public.same_tenant(tenant_id) AND ((uploaded_by = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id))));


--
-- Name: problem_statement_messages same tenant can access messages; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "same tenant can access messages" ON public.problem_statement_messages TO authenticated USING ((public.same_tenant(tenant_id) AND ((sender_id = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id)))) WITH CHECK ((public.same_tenant(tenant_id) AND ((sender_id = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id))));


--
-- Name: problem_statement_remarks same tenant can access remarks; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "same tenant can access remarks" ON public.problem_statement_remarks TO authenticated USING ((public.same_tenant(tenant_id) AND ((author_id = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id)))) WITH CHECK ((public.same_tenant(tenant_id) AND ((author_id = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id))));


--
-- Name: submission_batch_items same tenant can access submission batch items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "same tenant can access submission batch items" ON public.submission_batch_items TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.submission_batches b
  WHERE ((b.id = submission_batch_items.batch_id) AND public.same_tenant(b.tenant_id) AND ((b.submitted_by = auth.uid()) OR public.is_tenant_admin(b.tenant_id) OR public.is_tenant_deptadmin(b.tenant_id)))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM public.submission_batches b
  WHERE ((b.id = submission_batch_items.batch_id) AND public.same_tenant(b.tenant_id) AND ((b.submitted_by = auth.uid()) OR public.is_tenant_admin(b.tenant_id) OR public.is_tenant_deptadmin(b.tenant_id))))));


--
-- Name: problem_statements same tenant can create problem statements; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "same tenant can create problem statements" ON public.problem_statements FOR INSERT TO authenticated WITH CHECK ((public.same_tenant(tenant_id) AND ((created_by = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id))));


--
-- Name: submission_batches same tenant can insert submission batches; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "same tenant can insert submission batches" ON public.submission_batches FOR INSERT TO authenticated WITH CHECK ((public.same_tenant(tenant_id) AND ((submitted_by = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id))));


--
-- Name: problem_statements same tenant can update problem statements; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "same tenant can update problem statements" ON public.problem_statements FOR UPDATE TO authenticated USING ((public.same_tenant(tenant_id) AND ((created_by = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id)))) WITH CHECK ((public.same_tenant(tenant_id) AND ((created_by = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id))));


--
-- Name: submission_batches same tenant can update submission batches; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "same tenant can update submission batches" ON public.submission_batches FOR UPDATE TO authenticated USING ((public.same_tenant(tenant_id) AND ((submitted_by = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id)))) WITH CHECK ((public.same_tenant(tenant_id) AND ((submitted_by = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id))));


--
-- Name: problem_statement_reviews same tenant can view reviews; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "same tenant can view reviews" ON public.problem_statement_reviews FOR SELECT TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.problem_statements ps
  WHERE ((ps.id = problem_statement_reviews.problem_statement_id) AND public.same_tenant(ps.tenant_id) AND (public.is_tenant_admin(ps.tenant_id) OR public.is_tenant_deptadmin(ps.tenant_id) OR (ps.created_by = auth.uid()))))));


--
-- Name: submission_batches same tenant can view submission batches; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "same tenant can view submission batches" ON public.submission_batches FOR SELECT TO authenticated USING ((public.same_tenant(tenant_id) AND ((submitted_by = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id))));


--
-- Name: submission_batch_items; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.submission_batch_items ENABLE ROW LEVEL SECURITY;

--
-- Name: submission_batches; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.submission_batches ENABLE ROW LEVEL SECURITY;

--
-- Name: team_registrations; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.team_registrations ENABLE ROW LEVEL SECURITY;

--
-- Name: user_queries tenant admins can delete tenant queries; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can delete tenant queries" ON public.user_queries FOR DELETE TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id)));


--
-- Name: team_registrations tenant admins can delete tenant registrations; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can delete tenant registrations" ON public.team_registrations FOR DELETE TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id)));


--
-- Name: contest_settings tenant admins can manage contest settings; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can manage contest settings" ON public.contest_settings TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id))) WITH CHECK ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id)));


--
-- Name: events tenant admins can manage events; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can manage events" ON public.events TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id))) WITH CHECK ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id)));


--
-- Name: page_content tenant admins can manage page content; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can manage page content" ON public.page_content TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id))) WITH CHECK ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id)));


--
-- Name: resources tenant admins can manage resources; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can manage resources" ON public.resources TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id))) WITH CHECK ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id)));


--
-- Name: problem_statement_reviews tenant admins can manage reviews; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can manage reviews" ON public.problem_statement_reviews TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.problem_statements ps
  WHERE ((ps.id = problem_statement_reviews.problem_statement_id) AND public.same_tenant(ps.tenant_id) AND (public.is_tenant_admin(ps.tenant_id) OR public.is_tenant_deptadmin(ps.tenant_id)))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM public.problem_statements ps
  WHERE ((ps.id = problem_statement_reviews.problem_statement_id) AND public.same_tenant(ps.tenant_id) AND (public.is_tenant_admin(ps.tenant_id) OR public.is_tenant_deptadmin(ps.tenant_id))))));


--
-- Name: event_registrations tenant admins can manage tenant event registrations; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can manage tenant event registrations" ON public.event_registrations FOR UPDATE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.events e
  WHERE ((e.id = event_registrations.event_id) AND public.same_tenant(e.tenant_id) AND public.is_tenant_admin(e.tenant_id))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM public.events e
  WHERE ((e.id = event_registrations.event_id) AND public.same_tenant(e.tenant_id) AND public.is_tenant_admin(e.tenant_id)))));


--
-- Name: user_roles tenant admins can manage tenant roles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can manage tenant roles" ON public.user_roles TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id))) WITH CHECK ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id)));


--
-- Name: themes tenant admins can manage themes; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can manage themes" ON public.themes TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id))) WITH CHECK ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id)));


--
-- Name: profiles tenant admins can update tenant profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can update tenant profiles" ON public.profiles FOR UPDATE TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id))) WITH CHECK ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id)));


--
-- Name: user_queries tenant admins can update tenant queries; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can update tenant queries" ON public.user_queries FOR UPDATE TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id))) WITH CHECK ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id)));


--
-- Name: profiles tenant admins can view tenant profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant admins can view tenant profiles" ON public.profiles FOR SELECT TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_admin(tenant_id)));


--
-- Name: themes tenant deptadmins can manage themes; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant deptadmins can manage themes" ON public.themes TO authenticated USING ((public.same_tenant(tenant_id) AND public.is_tenant_deptadmin(tenant_id))) WITH CHECK ((public.same_tenant(tenant_id) AND public.is_tenant_deptadmin(tenant_id)));


--
-- Name: themes tenant users can read themes; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "tenant users can read themes" ON public.themes FOR SELECT TO authenticated USING (public.same_tenant(tenant_id));


--
-- Name: tenants; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.tenants ENABLE ROW LEVEL SECURITY;

--
-- Name: themes; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.themes ENABLE ROW LEVEL SECURITY;

--
-- Name: user_queries; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_queries ENABLE ROW LEVEL SECURITY;

--
-- Name: user_roles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;

--
-- Name: event_registrations users can insert own tenant event registrations; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "users can insert own tenant event registrations" ON public.event_registrations FOR INSERT TO authenticated WITH CHECK (((user_id = auth.uid()) AND (EXISTS ( SELECT 1
   FROM public.events e
  WHERE ((e.id = event_registrations.event_id) AND public.same_tenant(e.tenant_id))))));


--
-- Name: profiles users can insert own tenant profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "users can insert own tenant profile" ON public.profiles FOR INSERT TO authenticated WITH CHECK (((id = auth.uid()) AND (tenant_id IS NOT NULL)));


--
-- Name: team_registrations users can insert own tenant registrations; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "users can insert own tenant registrations" ON public.team_registrations FOR INSERT TO authenticated WITH CHECK ((public.same_tenant(tenant_id) AND (user_id = auth.uid())));


--
-- Name: user_queries users can submit own tenant queries; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "users can submit own tenant queries" ON public.user_queries FOR INSERT TO authenticated WITH CHECK ((public.same_tenant(tenant_id) AND ((user_id = auth.uid()) OR (user_id IS NULL))));


--
-- Name: profiles users can update own tenant profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "users can update own tenant profile" ON public.profiles FOR UPDATE TO authenticated USING (((id = auth.uid()) AND public.same_tenant(tenant_id))) WITH CHECK (((id = auth.uid()) AND public.same_tenant(tenant_id)));


--
-- Name: team_registrations users can update own tenant registrations; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "users can update own tenant registrations" ON public.team_registrations FOR UPDATE TO authenticated USING ((public.same_tenant(tenant_id) AND ((user_id = auth.uid()) OR public.is_tenant_admin(tenant_id)))) WITH CHECK ((public.same_tenant(tenant_id) AND ((user_id = auth.uid()) OR public.is_tenant_admin(tenant_id))));


--
-- Name: event_registrations users can view own tenant event registrations; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "users can view own tenant event registrations" ON public.event_registrations FOR SELECT TO authenticated USING (((user_id = auth.uid()) OR (EXISTS ( SELECT 1
   FROM public.events e
  WHERE ((e.id = event_registrations.event_id) AND public.same_tenant(e.tenant_id) AND public.is_tenant_admin(e.tenant_id))))));


--
-- Name: profiles users can view own tenant profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "users can view own tenant profile" ON public.profiles FOR SELECT TO authenticated USING (((id = auth.uid()) AND public.same_tenant(tenant_id)));


--
-- Name: user_queries users can view own tenant queries; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "users can view own tenant queries" ON public.user_queries FOR SELECT TO authenticated USING ((public.same_tenant(tenant_id) AND ((user_id = auth.uid()) OR public.is_tenant_admin(tenant_id))));


--
-- Name: team_registrations users can view own tenant registrations; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "users can view own tenant registrations" ON public.team_registrations FOR SELECT TO authenticated USING ((public.same_tenant(tenant_id) AND ((user_id = auth.uid()) OR public.is_tenant_admin(tenant_id) OR public.is_tenant_deptadmin(tenant_id))));


--
-- Name: user_roles users can view own tenant roles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "users can view own tenant roles" ON public.user_roles FOR SELECT TO authenticated USING (((user_id = auth.uid()) AND public.same_tenant(tenant_id)));


--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Admins can delete resource files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Admins can delete resource files" ON storage.objects FOR DELETE USING (((bucket_id = 'resources'::text) AND public.has_role(auth.uid(), 'admin'::public.app_role)));


--
-- Name: objects Admins can manage all team document files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Admins can manage all team document files" ON storage.objects USING (((bucket_id = 'team-documents'::text) AND public.has_role(auth.uid(), 'admin'::public.app_role))) WITH CHECK (((bucket_id = 'team-documents'::text) AND public.has_role(auth.uid(), 'admin'::public.app_role)));


--
-- Name: objects Admins can update resource files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Admins can update resource files" ON storage.objects FOR UPDATE USING (((bucket_id = 'resources'::text) AND public.has_role(auth.uid(), 'admin'::public.app_role)));


--
-- Name: objects Admins can upload resource files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Admins can upload resource files" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'resources'::text) AND public.has_role(auth.uid(), 'admin'::public.app_role)));


--
-- Name: objects Admins can view all team document files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Admins can view all team document files" ON storage.objects FOR SELECT USING (((bucket_id = 'team-documents'::text) AND public.has_role(auth.uid(), 'admin'::public.app_role)));


--
-- Name: objects Allow authenticated uploads; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow authenticated uploads" ON storage.objects FOR INSERT TO authenticated WITH CHECK ((bucket_id = 'event_images'::text));


--
-- Name: objects Allow authenticated users to update team documents 1t7ma14_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow authenticated users to update team documents 1t7ma14_0" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'team-documents'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Allow authenticated users to update team documents 1t7ma14_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow authenticated users to update team documents 1t7ma14_1" ON storage.objects FOR SELECT TO authenticated USING (((bucket_id = 'team-documents'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Authenticated users can delete team documents 1t7ma14_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Authenticated users can delete team documents 1t7ma14_0" ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'team-documents'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Authenticated users can delete team documents 1t7ma14_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Authenticated users can delete team documents 1t7ma14_1" ON storage.objects FOR SELECT TO authenticated USING (((bucket_id = 'team-documents'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Authenticated users can read documents; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Authenticated users can read documents" ON storage.objects FOR SELECT TO authenticated USING ((bucket_id = 'documents'::text));


--
-- Name: objects Authenticated users can read team documents; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Authenticated users can read team documents" ON storage.objects FOR SELECT TO authenticated USING ((bucket_id = 'team-documents'::text));


--
-- Name: objects Authenticated users can read their files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Authenticated users can read their files" ON storage.objects FOR SELECT TO authenticated USING ((bucket_id = 'documents'::text));


--
-- Name: objects Authenticated users can upload files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Authenticated users can upload files" ON storage.objects FOR INSERT TO authenticated WITH CHECK ((bucket_id = 'documents'::text));


--
-- Name: objects Authenticated users can upload team documents; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Authenticated users can upload team documents" ON storage.objects FOR INSERT TO authenticated WITH CHECK ((bucket_id = 'team-documents'::text));


--
-- Name: objects Public can view resource files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Public can view resource files" ON storage.objects FOR SELECT USING ((bucket_id = 'resources'::text));


--
-- Name: objects Public read access for event images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Public read access for event images" ON storage.objects FOR SELECT USING ((bucket_id = 'event_images'::text));


--
-- Name: objects Public read event images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Public read event images" ON storage.objects FOR SELECT USING ((bucket_id = 'event_images'::text));


--
-- Name: objects Users can delete own ps documents or admins; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can delete own ps documents or admins" ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'ps-documents'::text) AND (public.is_admin_user() OR ((auth.uid())::text = (storage.foldername(name))[1]))));


--
-- Name: objects Users can delete their own team document files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can delete their own team document files" ON storage.objects FOR DELETE USING (((bucket_id = 'team-documents'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: objects Users can read own ps documents or admins; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can read own ps documents or admins" ON storage.objects FOR SELECT TO authenticated USING (((bucket_id = 'ps-documents'::text) AND (public.is_admin_user() OR ((auth.uid())::text = (storage.foldername(name))[1]))));


--
-- Name: objects Users can update own ps documents or admins; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can update own ps documents or admins" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'ps-documents'::text) AND (public.is_admin_user() OR ((auth.uid())::text = (storage.foldername(name))[1]))));


--
-- Name: objects Users can update their own team document files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can update their own team document files" ON storage.objects FOR UPDATE USING (((bucket_id = 'team-documents'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: objects Users can upload own ps documents; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can upload own ps documents" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'ps-documents'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: objects Users can upload their own team document files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can upload their own team document files" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'team-documents'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: objects Users can view their own team document files; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Users can view their own team document files" ON storage.objects FOR SELECT USING (((bucket_id = 'team-documents'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: supabase_admin
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime_messages_publication OWNER TO supabase_admin;

--
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: supabase_admin
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA cron; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA cron TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT USAGE ON SCHEMA cron TO postgres;
RESET SESSION AUTHORIZATION;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION alter_job(job_id bigint, schedule text, command text, database text, username text, active boolean); Type: ACL; Schema: cron; Owner: supabase_admin
--

GRANT ALL ON FUNCTION cron.alter_job(job_id bigint, schedule text, command text, database text, username text, active boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION job_cache_invalidate(); Type: ACL; Schema: cron; Owner: supabase_admin
--

GRANT ALL ON FUNCTION cron.job_cache_invalidate() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION schedule(schedule text, command text); Type: ACL; Schema: cron; Owner: supabase_admin
--

GRANT ALL ON FUNCTION cron.schedule(schedule text, command text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION schedule(job_name text, schedule text, command text); Type: ACL; Schema: cron; Owner: supabase_admin
--

GRANT ALL ON FUNCTION cron.schedule(job_name text, schedule text, command text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION schedule_in_database(job_name text, schedule text, command text, database text, username text, active boolean); Type: ACL; Schema: cron; Owner: supabase_admin
--

GRANT ALL ON FUNCTION cron.schedule_in_database(job_name text, schedule text, command text, database text, username text, active boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION unschedule(job_id bigint); Type: ACL; Schema: cron; Owner: supabase_admin
--

GRANT ALL ON FUNCTION cron.unschedule(job_id bigint) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION unschedule(job_name text); Type: ACL; Schema: cron; Owner: supabase_admin
--

GRANT ALL ON FUNCTION cron.unschedule(job_name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION archive_completed_events(p_older_than interval); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.archive_completed_events(p_older_than interval) TO anon;
GRANT ALL ON FUNCTION public.archive_completed_events(p_older_than interval) TO authenticated;
GRANT ALL ON FUNCTION public.archive_completed_events(p_older_than interval) TO service_role;


--
-- Name: FUNCTION archive_past_events(p_older_than interval); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.archive_past_events(p_older_than interval) TO anon;
GRANT ALL ON FUNCTION public.archive_past_events(p_older_than interval) TO authenticated;
GRANT ALL ON FUNCTION public.archive_past_events(p_older_than interval) TO service_role;


--
-- Name: FUNCTION can_access_problem_statement(ps_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.can_access_problem_statement(ps_id uuid) TO anon;
GRANT ALL ON FUNCTION public.can_access_problem_statement(ps_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.can_access_problem_statement(ps_id uuid) TO service_role;


--
-- Name: FUNCTION check_email_exists(_email text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.check_email_exists(_email text) TO anon;
GRANT ALL ON FUNCTION public.check_email_exists(_email text) TO authenticated;
GRANT ALL ON FUNCTION public.check_email_exists(_email text) TO service_role;


--
-- Name: FUNCTION check_team_name_exists(team_name_input text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.check_team_name_exists(team_name_input text) TO anon;
GRANT ALL ON FUNCTION public.check_team_name_exists(team_name_input text) TO authenticated;
GRANT ALL ON FUNCTION public.check_team_name_exists(team_name_input text) TO service_role;


--
-- Name: FUNCTION current_department_id(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.current_department_id() TO anon;
GRANT ALL ON FUNCTION public.current_department_id() TO authenticated;
GRANT ALL ON FUNCTION public.current_department_id() TO service_role;


--
-- Name: FUNCTION current_tenant_id(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.current_tenant_id() TO anon;
GRANT ALL ON FUNCTION public.current_tenant_id() TO authenticated;
GRANT ALL ON FUNCTION public.current_tenant_id() TO service_role;


--
-- Name: FUNCTION deactivate_past_events(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.deactivate_past_events() TO anon;
GRANT ALL ON FUNCTION public.deactivate_past_events() TO authenticated;
GRANT ALL ON FUNCTION public.deactivate_past_events() TO service_role;


--
-- Name: FUNCTION handle_new_team_registration(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_new_team_registration() TO anon;
GRANT ALL ON FUNCTION public.handle_new_team_registration() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_team_registration() TO service_role;


--
-- Name: FUNCTION handle_new_user(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;


--
-- Name: FUNCTION has_role(_user_id uuid, _role public.app_role); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.has_role(_user_id uuid, _role public.app_role) TO anon;
GRANT ALL ON FUNCTION public.has_role(_user_id uuid, _role public.app_role) TO authenticated;
GRANT ALL ON FUNCTION public.has_role(_user_id uuid, _role public.app_role) TO service_role;


--
-- Name: FUNCTION has_tenant_role(_role public.app_role, _tenant_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.has_tenant_role(_role public.app_role, _tenant_id uuid) TO anon;
GRANT ALL ON FUNCTION public.has_tenant_role(_role public.app_role, _tenant_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.has_tenant_role(_role public.app_role, _tenant_id uuid) TO service_role;


--
-- Name: FUNCTION increment_curr_registrations(problem_uuid uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.increment_curr_registrations(problem_uuid uuid) TO anon;
GRANT ALL ON FUNCTION public.increment_curr_registrations(problem_uuid uuid) TO authenticated;
GRANT ALL ON FUNCTION public.increment_curr_registrations(problem_uuid uuid) TO service_role;


--
-- Name: FUNCTION is_admin_user(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.is_admin_user() TO anon;
GRANT ALL ON FUNCTION public.is_admin_user() TO authenticated;
GRANT ALL ON FUNCTION public.is_admin_user() TO service_role;


--
-- Name: FUNCTION is_tenant_admin(_tenant_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.is_tenant_admin(_tenant_id uuid) TO anon;
GRANT ALL ON FUNCTION public.is_tenant_admin(_tenant_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.is_tenant_admin(_tenant_id uuid) TO service_role;


--
-- Name: FUNCTION is_tenant_deptadmin(_tenant_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.is_tenant_deptadmin(_tenant_id uuid) TO anon;
GRANT ALL ON FUNCTION public.is_tenant_deptadmin(_tenant_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.is_tenant_deptadmin(_tenant_id uuid) TO service_role;


--
-- Name: FUNCTION prevent_theme_delete(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.prevent_theme_delete() TO anon;
GRANT ALL ON FUNCTION public.prevent_theme_delete() TO authenticated;
GRANT ALL ON FUNCTION public.prevent_theme_delete() TO service_role;


--
-- Name: FUNCTION problem_statements_set_defaults(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.problem_statements_set_defaults() TO anon;
GRANT ALL ON FUNCTION public.problem_statements_set_defaults() TO authenticated;
GRANT ALL ON FUNCTION public.problem_statements_set_defaults() TO service_role;


--
-- Name: FUNCTION same_tenant(_tenant_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.same_tenant(_tenant_id uuid) TO anon;
GRANT ALL ON FUNCTION public.same_tenant(_tenant_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.same_tenant(_tenant_id uuid) TO service_role;


--
-- Name: FUNCTION set_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.set_updated_at() TO anon;
GRANT ALL ON FUNCTION public.set_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.set_updated_at() TO service_role;


--
-- Name: FUNCTION sync_profile_role(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.sync_profile_role() TO anon;
GRANT ALL ON FUNCTION public.sync_profile_role() TO authenticated;
GRANT ALL ON FUNCTION public.sync_profile_role() TO service_role;


--
-- Name: FUNCTION sync_profiles_from_user_roles(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.sync_profiles_from_user_roles() TO anon;
GRANT ALL ON FUNCTION public.sync_profiles_from_user_roles() TO authenticated;
GRANT ALL ON FUNCTION public.sync_profiles_from_user_roles() TO service_role;


--
-- Name: FUNCTION sync_user_roles_from_profiles(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.sync_user_roles_from_profiles() TO anon;
GRANT ALL ON FUNCTION public.sync_user_roles_from_profiles() TO authenticated;
GRANT ALL ON FUNCTION public.sync_user_roles_from_profiles() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION send_binary(payload bytea, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION wal2json_escape_identifier(name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.wal2json_escape_identifier(name text) TO postgres;
GRANT ALL ON FUNCTION realtime.wal2json_escape_identifier(name text) TO dashboard_user;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE custom_oauth_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.custom_oauth_providers TO postgres;
GRANT ALL ON TABLE auth.custom_oauth_providers TO dashboard_user;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE webauthn_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_challenges TO postgres;
GRANT ALL ON TABLE auth.webauthn_challenges TO dashboard_user;


--
-- Name: TABLE webauthn_credentials; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.webauthn_credentials TO postgres;
GRANT ALL ON TABLE auth.webauthn_credentials TO dashboard_user;


--
-- Name: TABLE job; Type: ACL; Schema: cron; Owner: supabase_admin
--

GRANT SELECT ON TABLE cron.job TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE cron.job TO postgres;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE job_run_details; Type: ACL; Schema: cron; Owner: supabase_admin
--

GRANT ALL ON TABLE cron.job_run_details TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON TABLE cron.job_run_details TO postgres;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE contest_settings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.contest_settings TO anon;
GRANT ALL ON TABLE public.contest_settings TO authenticated;
GRANT ALL ON TABLE public.contest_settings TO service_role;


--
-- Name: TABLE departments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.departments TO anon;
GRANT ALL ON TABLE public.departments TO authenticated;
GRANT ALL ON TABLE public.departments TO service_role;


--
-- Name: TABLE event_registrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.event_registrations TO anon;
GRANT ALL ON TABLE public.event_registrations TO authenticated;
GRANT ALL ON TABLE public.event_registrations TO service_role;


--
-- Name: TABLE events; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.events TO anon;
GRANT ALL ON TABLE public.events TO authenticated;
GRANT ALL ON TABLE public.events TO service_role;


--
-- Name: TABLE events_archive; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.events_archive TO anon;
GRANT ALL ON TABLE public.events_archive TO authenticated;
GRANT ALL ON TABLE public.events_archive TO service_role;


--
-- Name: TABLE page_content; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.page_content TO anon;
GRANT ALL ON TABLE public.page_content TO authenticated;
GRANT ALL ON TABLE public.page_content TO service_role;


--
-- Name: TABLE problem_statement_alerts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.problem_statement_alerts TO anon;
GRANT ALL ON TABLE public.problem_statement_alerts TO authenticated;
GRANT ALL ON TABLE public.problem_statement_alerts TO service_role;


--
-- Name: TABLE problem_statement_attachments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.problem_statement_attachments TO anon;
GRANT ALL ON TABLE public.problem_statement_attachments TO authenticated;
GRANT ALL ON TABLE public.problem_statement_attachments TO service_role;


--
-- Name: TABLE problem_statement_messages; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.problem_statement_messages TO anon;
GRANT ALL ON TABLE public.problem_statement_messages TO authenticated;
GRANT ALL ON TABLE public.problem_statement_messages TO service_role;


--
-- Name: TABLE problem_statement_remarks; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.problem_statement_remarks TO anon;
GRANT ALL ON TABLE public.problem_statement_remarks TO authenticated;
GRANT ALL ON TABLE public.problem_statement_remarks TO service_role;


--
-- Name: SEQUENCE problem_statement_remarks_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.problem_statement_remarks_id_seq TO anon;
GRANT ALL ON SEQUENCE public.problem_statement_remarks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.problem_statement_remarks_id_seq TO service_role;


--
-- Name: TABLE problem_statement_reviews; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.problem_statement_reviews TO anon;
GRANT ALL ON TABLE public.problem_statement_reviews TO authenticated;
GRANT ALL ON TABLE public.problem_statement_reviews TO service_role;


--
-- Name: TABLE problem_statements; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.problem_statements TO anon;
GRANT ALL ON TABLE public.problem_statements TO authenticated;
GRANT ALL ON TABLE public.problem_statements TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- Name: TABLE resources; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.resources TO anon;
GRANT ALL ON TABLE public.resources TO authenticated;
GRANT ALL ON TABLE public.resources TO service_role;


--
-- Name: TABLE submission_batch_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.submission_batch_items TO anon;
GRANT ALL ON TABLE public.submission_batch_items TO authenticated;
GRANT ALL ON TABLE public.submission_batch_items TO service_role;


--
-- Name: TABLE submission_batches; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.submission_batches TO anon;
GRANT ALL ON TABLE public.submission_batches TO authenticated;
GRANT ALL ON TABLE public.submission_batches TO service_role;


--
-- Name: TABLE team_registrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.team_registrations TO anon;
GRANT ALL ON TABLE public.team_registrations TO authenticated;
GRANT ALL ON TABLE public.team_registrations TO service_role;


--
-- Name: TABLE tenants; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tenants TO anon;
GRANT ALL ON TABLE public.tenants TO authenticated;
GRANT ALL ON TABLE public.tenants TO service_role;


--
-- Name: TABLE themes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.themes TO anon;
GRANT ALL ON TABLE public.themes TO authenticated;
GRANT ALL ON TABLE public.themes TO service_role;


--
-- Name: TABLE user_queries; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_queries TO anon;
GRANT ALL ON TABLE public.user_queries TO authenticated;
GRANT ALL ON TABLE public.user_queries TO service_role;


--
-- Name: TABLE user_roles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_roles TO anon;
GRANT ALL ON TABLE public.user_roles TO authenticated;
GRANT ALL ON TABLE public.user_roles TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE messages_2026_02_12; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_02_12 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_02_12 TO dashboard_user;


--
-- Name: TABLE messages_2026_02_13; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_02_13 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_02_13 TO dashboard_user;


--
-- Name: TABLE messages_2026_02_14; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_02_14 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_02_14 TO dashboard_user;


--
-- Name: TABLE messages_2026_02_15; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_02_15 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_02_15 TO dashboard_user;


--
-- Name: TABLE messages_2026_02_16; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_02_16 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_02_16 TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: cron; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA cron GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: cron; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA cron GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: cron; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA cron GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict C0sGbBiBpEHfwbNsn2gx8RqxaGtY5dyIAubPO8BZtitELSuihOl8S6ceicDPVtU

