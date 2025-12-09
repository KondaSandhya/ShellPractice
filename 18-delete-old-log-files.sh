#!/bin/bash
set -euo pipefail

find . -name "*.log" -type f -mtime +9 
