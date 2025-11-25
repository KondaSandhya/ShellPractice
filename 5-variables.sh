#!/bin/bash

echo "Enter your username:"
read username
echo "enter your password:"
#Here -s flag reads the password silently means it wont display anything while typing pwd
read -s password
#Its not best practice to display the password on the screen
echo "password for user $username is set as : $password"