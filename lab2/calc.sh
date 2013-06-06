#!/bin/bash

usage="Usage: $0 num1 op num2\nop must be plus, minus, times, over or pow\n"

if [ $# -ne 3 ]
then
    printf "$usage"
    exit 1
fi

num1=$1
num2=$3
op=$2

opStr="$num1 $op $num2 is"

case "$op" in
    "plus" ) printf "$opStr $(($num1+$num2))\n";;
    "minus" ) printf "$opStr $(($num1-$num2))\n";;
    "times" ) printf "$opStr $(($num1*$num2))\n";;
    "over" ) printf "$opStr $(($num1/$num2))\n";;
    "pow" ) printf "$opStr $(($num1**$num2))\n";;
    *) printf "$usage"
	exit 1;;
esac
