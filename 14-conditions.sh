#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ];
then
echo "ERROR:Please run this with root privileges"
else
echo "You are root user"
exit 1
fi
dnf install nginxx -y
exit 1

dnf install mysqq11 -y
