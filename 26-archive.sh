#!/bin/bash

source_dir=$1
dest_dir=$2
days=${3:-14}
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

usage(){
    echo -e "${R}USAGE: $0 [SOURCE_DIR] [days(optional,default to 14 days)] ${N}"
    exit 1
}
if [ -z "$source_dir" ] || [ -z "$dest_dir" ]; then
    echo "ERROR:Either source or dest dir is missing"
    usage
fi


if [ ! -d "$source_dir" ]; then
    echo -e "${R} source_directory: $source_dir doesn't exists"
    exit 1
fi

if [ ! -d "$dest_dir" ]; then
    echo -e "${R} destination_dir: $dest_dir doesn't exists"
    exit 1
fi

files_to_archive=$(find $source_dir -name "*.log" -type f -mtime +$days)

if [ -z "$files_to_archive" ]; then
    echo "No log files found more then $days in $source_dir"
    exit 0
fi

timestamp=$(date+%Y-%m-%d-%H-%M-%S)

filename=$dest_dir/logs-$timestamp.tar.gz

tar -czf $filename $files_to_archive

if [ $? -ne o ];then
    echo "Logs archival failed"
    exit 1
else
echo  "Files got archived : $filename"

while IFS= read -r line
do 

echo "Files going to be deleted:$line"
rm -rf $line
echo "Files deleted:$line"

done <<< $files_to_archive