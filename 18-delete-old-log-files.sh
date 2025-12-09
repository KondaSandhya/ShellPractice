#!/bin/bash
set -euo pipefail

find . -type -f -name "*.log" -mtime +9 
