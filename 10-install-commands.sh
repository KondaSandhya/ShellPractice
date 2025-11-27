#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ] then
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
    if [ $? -eq 0 ]
    then
        echo "Mysql is installed successfully"
    else
        echo "Mysql Installation failure"
    fi
else 
    echo "Mysql is already installed"
fi

