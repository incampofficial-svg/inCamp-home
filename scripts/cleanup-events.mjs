#!/usr/bin/env node
// Deletes events from the `events` table where the deadline column is before now.
// Usage: set SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in env. Optionally set
// SUPABASE_EVENTS_DEADLINE_COLUMN (defaults to "deadline").

const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
const DEADLINE_COLUMN = process.env.SUPABASE_EVENTS_DEADLINE_COLUMN || 'deadline';

if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
  console.error('Missing required environment variables: SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY');
  process.exit(1);
}

const now = new Date().toISOString();
const base = SUPABASE_URL.replace(/\/$/, '');
const url = `${base}/rest/v1/events?${encodeURIComponent(DEADLINE_COLUMN)}=lt.${encodeURIComponent(now)}`;

console.log('Deleting events where', DEADLINE_COLUMN, 'is before', now);

try {
  const res = await fetch(url, {
    method: 'DELETE',
    headers: {
      apikey: SUPABASE_SERVICE_ROLE_KEY,
      Authorization: `Bearer ${SUPABASE_SERVICE_ROLE_KEY}`,
      'Content-Type': 'application/json',
      Prefer: 'return=representation'
    }
  });

  const body = await res.text();
  console.log('Supabase response status:', res.status);
  if (body) console.log('Response body:', body);

  if (!res.ok) {
    console.error('Failed to delete expired events');
    process.exit(1);
  }

  console.log('Expired events cleanup completed successfully.');
} catch (err) {
  console.error('Error during cleanup:', err);
  process.exit(1);
}
