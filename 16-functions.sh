#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [$? -ne 0 ];
    then
    echo "Installation failed"
    exit 1
    else
    echo "INstallation success"
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
VALIDATE

dnf install mysql -y
VALIDATE