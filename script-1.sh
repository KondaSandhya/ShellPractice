#!/bin/bash
NAME="Shell Scripting"

echo "Hello from: $0"

echo "PID of the script is: $$"

#./script-2.sh -- if we use this script 2 doeant have access to the variables from script1 and pid will be different

source ./script-2.sh # -- this will give access to the variables and pid will be same as script1
