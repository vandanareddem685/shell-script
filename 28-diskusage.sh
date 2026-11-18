#!/bin/bash

disk_usage=$( df -hT | grep -v Filesystem )
usage_threshod=20
server_ip=server_ip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read -r line
do

usage=$(echo $line|awk '{print $6}'|cut -d "%" -f1)
partition=$(echo $line|awk '{print $7}')

if [ $usage -ge $usage_threshod ]; then
    message+="High disk usage on $partition:$usage <br>"
fi
done <<< "$disk_usage"


echo -e "$message"

sh mail.sh "Devops Team" "$server_ip" "High disk usage" "$message" "vandanareddem685@gmail.com" "Warning:High disk usage alert" 