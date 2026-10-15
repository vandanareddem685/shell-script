#!/bin/bash

echo "All the args passed: $@"
echo "No.of args passed to the script: $#"
echo " First variable: $1"
echo "script name: $0"
echo "who is running the script :$USER"
echo "realpath: $(realpath $0)"
