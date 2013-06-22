#!/bin/bash

fullname=`grep $USERNAME /etc/passwd | cut -d: -f5`;
time=`date "+%l:%M%P" | sed -e 's/^ *//g'`;
procinfo=`grep "model name" /proc/cpuinfo | cut -d: -f2 | sed -e 's/^ *//g'`;
meminfo=`cat /proc/meminfo | grep "MemTotal" | cut -d: -f2 | sed -e 's/^ *//g'`;

echo "Welcome to $HOSTNAME, $fullname!";
echo "You are logged in as $USERNAME and your current directory is $PWD";
echo "The time is $time";
echo "System Processor: $procinfo";
echo "Sytem Memory: $meminfo";