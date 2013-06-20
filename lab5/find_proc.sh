#!/bin/bash

#arugemnt check and usage message
if [ $# -ne 1 ]
then
    echo "Usage: $0 process_name";
    exit;
fi

#ignore grep, find_proc, and ignore empty lines
psout=`ps -ef | grep $1 | grep -v grep | grep -v find_proc.sh`;
#count the number of lines with characters
psoutlen=`echo "$psout" | grep -c [:alphanum:]`;

#if we have found at least one row of output
if [ $psoutlen -gt 0 ]
then
    #print column headers
    ps -ef | head -n 1;
    #print the output
    echo "$psout";
fi
