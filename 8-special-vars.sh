#!/bin/bash

echo "Number of args passed: $#"
echo "All args: $@"
echo "Script name: $0"
echo "pid of the script: $$"
echo "User running the ecript: $USER"
echo "Home directory of current user: $HOME"
echo "last command exit status: $?"
sleep 10 &
echo "pid of last command running in background: $!"
