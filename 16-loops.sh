#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

packages=("mysql" "nginx" "httpd")

LOG_FOLDER="/var/logs/shellscript-logs"
SCRIPT_NAME=$(basename "$0" .sh)
#scriptName= $(echo $0|cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

if [ $USERID -ne 0 ]
then
    echo -e "$R You are running with non root user. Please use root user.....!  $N" | tee -a $LOG_FILE
    exit 1
else 
    echo "You are running with root user" | tee -a $LOG_FILE
fi

dnf list installed mysql &>>$LOG_FILE

for pkg in "${packages[@]}"
do
    dnf list installed $pkg &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$pkg is not installed, Going to install it ......!" | tee -a $LOG_FILE
        dnf install $pkg -y &>>$LOG_FILE
        validate $? $pkg
    else 
        echo -e "$Y $pkg is already installed $N" | tee -a $LOG_FILE
    fi

# dnf list installed nginx &>>$LOG_FILE

# if [ $? -ne 0 ]
# then
#     echo "nginx is not installed, Going to install it ......!" | tee -a $LOG_FILE
#     dnf install nginx -y &>>$LOG_FILE
#     VALIDATE $? "nginx"
# else 
#     echo -e "$Y nginx is already installed $N" | tee -a $LOG_FILE
# fi

VALIDATE()
{
    if [ $1 -eq 0 ]
    then 
        echo -e "$2 is installed $G successfully $N" | tee -a $LOG_FILE
    else
        echo -e "$2 installation $R failed $N" | tee -a $LOG_FILE
    fi
}
