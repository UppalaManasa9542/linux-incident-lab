# Linux Incident Lab (Nginx) — Hands-on Troubleshooting Portfolio

## Project Summary

This lab simulates real-world Linux production incidents involving Nginx on Ubuntu.  
It demonstrates structured troubleshooting, root cause analysis, and recovery verification using standard Linux administrative tools.

This repository documents realistic Linux troubleshooting scenarios using Nginx on Ubuntu.
Goal: demonstrate operational debugging skills (services, ports, processes, logs, and disk checks).

## What this repo proves
- Service management with systemd (`systemctl`)
- Port ownership and conflicts (`ss`, `lsof`)
- Process analysis and recovery (`top`, `ps`, `kill`)
- Log investigation (`tail`, `grep`, `journalctl`)
- Disk health checks (`df`, `du`)
- Verification mindset (`curl`)

## Environment
- OS: Ubuntu
- Service: Nginx
- Tools: systemctl, ss, lsof, top, ps, tail, grep, journalctl, df, du, curl

## Incidents
1. Service Down: `incidents/incident1-service-down.md`
2. Port Conflict: `incidents/incident2-port-conflict.md`
3. CPU Spike: `incidents/incident3-cpu-spike.md`
4. Log Investigation (404/traffic): `incidents/incident4-log-investigation.md`

## How to run
Follow each incident markdown file step-by-step. Each includes:
- Symptoms
- Diagnosis
- Fix
- Verification
