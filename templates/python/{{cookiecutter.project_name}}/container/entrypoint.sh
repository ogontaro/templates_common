#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

source /home/nonroot/app/.venv/bin/activate

echo "Container start"
exec "$@"
echo "Container finished"
