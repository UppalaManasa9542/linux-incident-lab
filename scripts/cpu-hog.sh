#!/bin/bash
set -euo pipefail

# Starts a CPU hog in the background and prints its PID.
# Stop it with: kill <PID>
# Run: ./scripts/cpu-hog.sh

yes > /dev/null &
echo "CPU hog started with PID: $!"
