#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R You are running with non root user. Please use root user.....!  $N"
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
    echo -e "$Y Mysql is already installed $N"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx is not installed, Going to install it ......!"
    dnf install nginx -y
    VALIDATE $? "nginx"
else 
    echo -e "$Y nginx is already installed $N"
fi

VALIDATE()
{
    if [ $1 -eq 0 ]
    then 
        echo -e "$2 is installed $G successfully $N"
    else
        echo -e "$2 installation $R failed $N"
    fi
}
