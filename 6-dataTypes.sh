#!/bin/bash

#sample addition we are trying
num1=$1
num2=$2

sum=$(($num1+$num2))

echo "The sum of $num1 and $num2 is: $sum"

#printing the date
timestamp=$(date)
echo "Todays date is: $timestamp"