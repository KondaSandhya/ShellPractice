#!/bin/bash
set -euo pipefail

# we can also use IFS= to avoid word splitting isses
# find . -name "*.log" -type f -mtine +7 -exec rm -f {} \;
# find . -name "*.log" -type f -mtime +9 -print -delete or just -delete

while read -r line; do
    echo "Deleting the file: $line"
    rm -rf "$line"
done <<< $(find . -name "*.log" -type f -mtime +9)
