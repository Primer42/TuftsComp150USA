#!/bin/bash

sum=0

printf "Enter each positive value to add to the sum, pressing return after each value.\nEnter a negative value to finish.\n"
read nextval
while [ $nextval -gt 0 ]; do
    sum=$(($sum+$nextval))
    read nextval
done

printf "sum is $sum\n"