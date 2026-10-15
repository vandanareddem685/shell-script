#!/bin/bash

echo "All the args passed: $@"
echo "No.of args passed to the script: $#"
echo " First variable: $1"
echo "script name: $0"
echo "who is running the script :$USER"
echo "realpath: $(realpath $0)"
echo "Directory of the current script: $PWD"
echo "Home directory of the current user: $HOME"
echo "PID of the current script: $$"
sleep 10&
echo "PID of the command running in background now: $!"
wait $!
echo "Line number:$LINENO"
echo "Previous command exit status: $?"
echo "Total time executed for this script: $SECONDS"