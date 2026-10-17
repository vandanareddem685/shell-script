#!/bin/bash

ID=$(id -u)

logs_folder = /var/logs/shellscript-practice
logs_file = $logs_folder/$0.log
mkdir -p ${logs_folder}

VALIDATE(){
    if [ $1 -ne 0 ];then
    echo "$2..FAILED" | tee -a $logs_file
    else
    echo "$2..SUCCESS" | tee -a $logs_file
    fi
}

if [ $ID -ne 0 ]
then
echo "Please run this script with root user"
exit 1
else
echo "You are root user"
fi

dnf install nginx -y & >> $logs_file
VALIDATE $? "Installing nginx"

dnf install mysql -y & >> $logs_file
VALIDATE $? "Installing mysql"