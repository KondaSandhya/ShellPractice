#!/bin/bash
set -euo pipefail

while IFS= read -r line; do
    echo "Deleting the file: $line"
done <<< $(find . -name "*.log" -type f -mtime +9)
