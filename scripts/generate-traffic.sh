#!/bin/bash
set -euo pipefail

# Generates simple traffic to localhost for log investigation.
# Run: ./scripts/generate-traffic.sh

urls=(
  "/"
  "/test"
  "/abc"
  "/nonexistentpage"
)

for u in "${urls[@]}"; do
  curl -s -o /dev/null -w "%{http_code} %{url_effective}\n" "http://localhost${u}"
done
