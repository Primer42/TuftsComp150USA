#!/bin/bash
#
# chkconfig: 345 98 2
# description: This script writes a log message when the computer is booted or shut down.

usagestr="Usage $0 [start|stop]";

if [ $# -ne 1 ] 
then
    echo "$usagestr";
    exit 1
elif [ "$1" = "start" ]
then
    echo `date` $HOSTNAME "booted!" >> /home/wrichard/boot.log
elif [ "$1" = "stop" ]
then
    echo `date` $HOSTNAME "shutting down" >> /home/wrichard/boot.log
else
    echo "$usagestr";
    exit 1
fi