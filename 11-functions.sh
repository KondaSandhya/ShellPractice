#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "You are running with non root user. Please use root user.....!"
    exit 1
else 
    echo "You are running with root user"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Mysql is not installed, Going to install it ......!"
    dnf install mysql -y
    validate $? "Mysql"
else 
    echo "Mysql is already installed"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx is not installed, Going to install it ......!"
    dnf install nginx -y
    validate $? "nginx"
else 
    echo "nginx is already installed"
fi

validate(){

    if [ $1 -eq 0 ]
    then 
        echo "$2 is installed successfully"
    else
        echo "$2 installation failed"
}
