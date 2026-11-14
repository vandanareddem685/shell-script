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


