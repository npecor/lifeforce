export default function handler(_request, response) {
  const config = {
    url: process.env.VITE_SUPABASE_URL || "",
    anonKey: process.env.VITE_SUPABASE_ANON_KEY || "",
  };

  response.setHeader("Content-Type", "application/javascript; charset=utf-8");
  response.setHeader("Cache-Control", "no-store");
  response.status(200).send(`window.ULC_LIFEFORCE_SUPABASE_CONFIG = ${JSON.stringify(config)};`);
}
