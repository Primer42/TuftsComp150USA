#!/bin/bash

while read LINE; do
    #get the fname and lname here, using cut
    fname=`echo $LINE | cut -d, -f 1`;
    lname=`echo $LINE | cut -d, -f 2`;
    
    lfname=`echo $fname | tr 'A-Z' 'a-z'`;
    llname=`echo $lname | tr 'A-Z' 'a-z'`;
    
    finitial=`echo ${lfname:0:1}`;
    username=`echo $finitial$llname`;

    passwd=`cat /dev/urandom | tr -dc 'A-Za-z0-9' | head -c 8`;

    /usr/sbin/groupadd $username;
    /usr/sbin/useradd -c "$fname $lname" -d /home/$username -g $username -m -s /bin/bash $username;
    echo $passwd | passwd --stdin $username;

    echo "Aadded $fname $lname: $username, $passwd";
    

done