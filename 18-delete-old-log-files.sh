#!/bin/bash
set -euo pipefail

while read -r line; do
    echo "Deleting the file: $line"
    rm -rf "$line"
done <<< $(find . -name "*.log" -type f -mtime +9)
