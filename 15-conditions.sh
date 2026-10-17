#/bin/nash

ID = $(id -u)

if [ $ID -ne 0 ]
then
echo "Please run this script with root user"
exit 1
else
echo "You are root user"
fi

dnf install nginx -y
if [ $? -ne 0 ]
then 
echo  "Nginx installation failed"
exit 1
else 
echo "Nginx installed successfully"
fi

dnf install mysql -y
if [ $? -ne 0 ]
then
echo "Mysql installation is failed"
exit 1
else
echo "Myswl installation is success"
fi