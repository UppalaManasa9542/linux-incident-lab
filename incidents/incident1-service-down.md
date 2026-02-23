# Incident 1 — Nginx Service Down

## Scenario
An alert indicated that the web application was unreachable on port 80.

## Symptoms Observed
- `curl -I localhost` returned: Connection refused
- Browser could not load the webpage

---

## Step 1 — Confirm the Outage

Command:curl -I localhost

Purpose:
To verify whether the service is responding locally before assuming a broader infrastructure issue.

Result:
Connection refused → confirms nginx is not serving traffic.

---

## Step 2 — Check Service Status

Command:systemctl status nginx --no-pager

Purpose:
To determine whether nginx is running, stopped, or failed.

Result:
Service was inactive (dead).

---

## Step 3 — Investigate Service Logs

Command:sudo journalctl -u nginx --no-pager | tail -20

Purpose:
To inspect service-level logs and identify startup or shutdown events.

Observation:
Logs confirmed nginx had been stopped.

---

## Step 4 — Restore Service

Command:sudo systemctl start nginx

Verification:systemctl status nginx --no-pager
curl -I localhost

Result:
- Service returned to active (running)
- HTTP headers confirmed successful response

---

## Root Cause
Service was manually stopped during testing.

---

## Key Learnings
- Always confirm outage using curl before deeper debugging.
- Use systemctl for service state inspection.
- Use journalctl for systemd service diagnostics.
- Always verify recovery after applying a fix.
