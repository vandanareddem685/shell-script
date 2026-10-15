#!/bin/bash

ID =  $(id -u)

if [ $ID -ne 0 ];
then
echo "ERROR:Please run this with root privileges"
else
echo "You are root user"
fi
dnf install nginx -y
