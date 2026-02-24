# Incident 4 — Log Investigation and Traffic Analysis

## Scenario
Users reported intermittent 404 errors while accessing specific URLs.

---

## Step 1 — Generate Test Traffic

Command:./scripts/generate-traffic.sh

Purpose:
To simulate multiple HTTP requests including valid and invalid endpoints.

---

## Step 2 — Inspect Recent Access Logs

Command:sudo tail -20 /var/log/nginx/access.log

Purpose:
To review recent incoming HTTP requests.

Observation:
Multiple entries with HTTP status code 404 were observed.

---

## Step 3 — Identify All 404 Errors

Command:sudo grep " 404 " /var/log/nginx/access.log

Purpose:
To filter and isolate failed requests.

---

## Step 4 — Count 404 Occurrences

Command:sudo grep " 404 " /var/log/nginx/access.log | wc -l

Purpose:
To quantify how many failed requests occurred.

---

## Step 5 — Inspect Nginx Error Log

Command:sudo tail -50 /var/log/nginx/error.log

Purpose:
To determine whether backend or configuration errors contributed to failures.

Observation:
No critical internal server errors were detected.

---

## Step 6 — Inspect Systemd Logs

Command:sudo journalctl -u nginx --since "30 minutes ago" --no-pager
Purpose:
To verify that nginx did not crash or restart during the time window.

---

## Step 7 — Check Disk Health

Command:df -h

Purpose:
To ensure disk usage was not contributing to instability.

---

## Root Cause
404 errors were caused by invalid endpoint requests rather than service instability.

---

## Key Learnings
- Access logs provide request-level visibility.
- `grep` enables targeted log analysis.
- Counting occurrences helps quantify impact.
- Always differentiate between application errors and infrastructure failures.
- Validate system health alongside log analysis.
