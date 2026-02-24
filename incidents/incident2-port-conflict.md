# Incident 2 — Port 80 Conflict (Address Already In Use)

## Scenario
Nginx failed to start due to port 80 already being in use.

---

## Symptoms Observed
- `sudo systemctl start nginx` failed
- `systemctl status nginx` showed bind error
- Error message: Address already in use

---

## Step 1 — Confirm Failure

Command:# Incident 2 — Port 80 Conflict (Address Already In Use)

## Scenario
Nginx failed to start due to port 80 already being in use.

---

## Symptoms Observed
- `sudo systemctl start nginx` failed
- `systemctl status nginx` showed bind error
- Error message: Address already in use

---

## Step 1 — Confirm Failure

Command:systemctl status nginx --no-pager

Purpose:
To confirm that nginx failed and inspect the failure reason.

Observation:
Service failed due to inability to bind to port 80.

---

## Step 2 — Identify Process Using Port 80

Command:sudo ss -tulnp | grep :80

Alternative:sudo lsof -i :80

Purpose:
To determine which process is currently listening on port 80.

Observation:
A Python HTTP server was occupying port 80.

---

## Step 3 — Terminate Conflicting Process

Command:sudo kill <PID>

Purpose:
To release port 80 so nginx can bind successfully.

---

## Step 4 — Restart Nginx

Command:sudo systemctl start nginx

Verification:systemctl status nginx --no-pager
curl -I localhost

Result:
- Service active
- HTTP response successful
- Port 80 correctly bound by nginx

---

## Root Cause
A temporary Python HTTP server was started on port 80 during testing.

---

## Key Learnings
- Always inspect port ownership when bind errors occur.
- Use `ss` or `lsof` to identify listening processes.
- Do not immediately restart blindly — identify root cause first.
- Always verify service restoration.
