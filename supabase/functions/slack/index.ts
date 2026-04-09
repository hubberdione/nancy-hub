// Supabase Edge Function — Slack API Proxy
// Deploy via: supabase functions deploy slack
// Or paste into Supabase Dashboard → Edge Functions → New Function → name: "slack"

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const { method, params, token } = await req.json();

    if (!token) {
      return new Response(JSON.stringify({ ok: false, error: "no_token" }), {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }
    if (!method) {
      return new Response(JSON.stringify({ ok: false, error: "no_method" }), {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    // Build form-encoded body for Slack API
    const body = new URLSearchParams();
    body.append("token", token);
    const p = params || {};
    Object.keys(p).forEach((k) => body.append(k, String(p[k])));

    const slackRes = await fetch(`https://slack.com/api/${method}`, {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: body.toString(),
    });

    const data = await slackRes.json();

    return new Response(JSON.stringify(data), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (e) {
    return new Response(
      JSON.stringify({ ok: false, error: e instanceof Error ? e.message : String(e) }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
