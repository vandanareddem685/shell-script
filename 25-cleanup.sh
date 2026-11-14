#!/bin/bash

source_dir=$1
days=${2:-14}
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

usage(){
    echo -e "${R}USAGE: $0 [SOURCE_DIR] [days(optional,default to 14 days)] ${N}"
    exit 1
}
if [ -z $source_dir ]; then
    echo "ERROR:Missing parameters"
    usage
fi

if [ ! -d "$source_dir" ]; then
    echo -e "${R} ERROR: $source_dir doesn't exists"
    exit 1
fi

echo "scanning files olderthan $days in $source_dir"

files_to_delete=$(find $source_dir -name "*.log" -type f -mtime +$days)

if [ -z "$files_to_delete" ]; then
    echo "No log files found more then $days in $source_dir"
    exit 0
fi

while IFS= read -r line
do 
    echo "File to be deleted: $line"
    rm -rf $line
    echo "file deleted: $line"
done <<< "$files_to_delete"

