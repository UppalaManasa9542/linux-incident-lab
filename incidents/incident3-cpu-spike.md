# Incident 3 — High CPU Utilization

## Scenario
Users reported slow response times while the web server was still reachable.

---

## Symptoms Observed
- Website was responding but slow
- System load appeared elevated

---

## Step 1 — Inspect System Resource Usage

Command:top

Purpose:
To inspect real-time CPU and memory usage.

Observation:
A background process (`yes`) was consuming high CPU.

---

## Step 2 — Identify Top CPU Consuming Processes

Command:kill <PID>

If necessary:kill -9 <PID>

Purpose:
To safely terminate the process consuming excessive CPU.

---

## Step 4 — Verify System Recovery

Command:top

Result:
CPU utilization returned to normal levels.

---

## Root Cause
A background test process was unintentionally consuming CPU resources.

---

## Key Learnings
- Use `top` for live performance diagnostics.
- Use `ps` with sorting to identify resource-heavy processes.
- Always confirm before terminating processes.
- Validate system stability after corrective action.
