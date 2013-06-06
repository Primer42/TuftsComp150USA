#!/bin/bash

if [ $# -gt 1 ]
then
    printf "Usage: $0 [user name]\n"
    exit 1
fi

if [ $# -eq 1 ]
then
    USER="$1"
fi

ps -ef | grep "^$USER" | awk '{print $1 " " $8}'