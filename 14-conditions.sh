#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ];
then
echo "ERROR:Please run this with root privileges"
exit1
else
echo "You are root user"
fi
dnf install nginxx -y
