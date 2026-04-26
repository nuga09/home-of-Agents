---
name: Designletta analytics project
description: GA4 + Fourthwall analytics pipeline and dashboard for Wioletta's UK stationery e-commerce brand
type: project
originSessionId: 238d77b2-029a-462b-866a-b16382e17eea
---
"Letta" or "Designletta" = Wioletta's UK design/stationery e-commerce brand (wioletta@designletta.com).

Project lives at: /home/nugad/Datascience/

**Why:** Wioletta runs Designletta on Fourthwall (UK). Current margin is ~20%, revenue ~£34/mo. Goal is to grow to £303/mo with 45% margin by pivoting to digital products, wedding suites, and better ad strategy.

**Pipeline:**
- Fourthwall CSV data → `data/real_average_order_value.csv`, `data/daily_metrics.csv`
- GA4 property: 497704547 | Account: a362244093
- `pipeline/update_dashboard.py` → `dashboard/data.json` (runs hourly)
- `pipeline/watcher.py` — polls Downloads folder every 30s for new CSVs (WSL2-safe, no inotify)
- `pipeline/orchestrator.py` — master scheduler (weekly/monthly reports, GA4 fetch)

**Dashboard:** `/home/nugad/Datascience/dashboard/index.html`
- Sections: KPI strip, Revenue Trend, Cost Donut, Orders Timeline, **Web Analytics** (sessions/traffic/devices/pages), Growth Opportunities, £1M Roadmap

**GA4 live stream status (as of 2026-04-26): NOT connected**
- `credentials.json` exists (client_id + client_secret present)
- `token.json` does NOT exist — OAuth not done
- To connect: run `python3 data/setup_oauth.py` — opens browser on port 8080, log in with wioletta@designletta.com, approves read-only GA4 access
- WSL2: must open URL in Windows browser manually (browser won't auto-open)
- Once token.json exists, `pipeline/ga4_fetcher.py` pulls live data every hour

**Watcher:** Was dead (PID 490437). Restarted 2026-04-26 at PID 27519.
- Restart command: `nohup python3 pipeline/watcher.py > /dev/null 2>&1 &`

**How to apply:** When user says "letta", "designletta", or "Wioletta analytics" — this is the project. The next thing to do is get the GA4 OAuth token set up to switch from sample data to live data.
