#!/bin/bash

usage="Usage: $0 start_line stop_line file\n"

if [ $# -ne 3 ]
then
    printf "Wrong number of arguments\n"
    printf "$usage"
    exit 1
elif [ ! -f $3 ]
then
    printf "3rd argument is not a file\n"
    printf "$usage"
    exit 1
elif [ $1 -gt $2 ]
then
    printf "start_line > stop_line\n"
    printf "$usage"
    exit 1
elif  [ $(cat $3 | wc -l) -lt $2 ]
then
    printf "$3 has fewer than $2 lines\n"
    printf "$usage"
    exit 1
fi

head -n $2 $3 | tail -n $(($2-$1+1))

