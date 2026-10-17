#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ];
then
echo "ERROR:Please run this with root privileges"
exit 1
else
echo "You are root user"
fi
dnf install nginx -y
exit 1

dnf install mysqq11 -y
