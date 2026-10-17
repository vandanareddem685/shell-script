#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ];then
    echo "$2..FAILED"
    else
    echo "$2..SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then
echo "Please run this script with root user"
exit 1
else
echo "You are root user"
fi

dnf install nginx -y
VALIDATE $? "Installing nginx"

dnf install mysql -y
VALIDATE $? "Installing mysql"