#!/bin/bash

if [ $# -gt 1 ]
then
    echo "Usage: $0 [-v]";
    exit 1
else
    ps -ef | grep $* '0 \[';
fi
