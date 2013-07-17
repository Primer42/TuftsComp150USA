#!/bin/bash

function get_valid_username {
    #make the basic username, using the passed full first and last names
    local fname=$1;
    local lname=$2;

    local lfname=`echo $fname | tr 'A-Z' 'a-z'`;
    local llname=`echo $lname | tr 'A-Z' 'a-z'`;
    
    local finitial=`echo ${lfname:0:1}`;
 
    #username is global, so we can just use it later in the script
    username=`echo $finitial$llname`;

    #test if the default username has been taken
    #add numbers to the end until we find one that isn't taken
    local num=0
    while cat /etc/passwd | cut -d: -f1 | grep -q $username; do
	local num=`expr $i + 1`
	username=`echo $username$num`
    done
}

function gerp_string {
    echo "$1" | grep -q "$2"
}

function get_good_password {
    passwd=`echo "bad_password"`
    until gerp_string $passwd "[[:digit:]]" && gerp_string $passwd "[[:upper:]]" && gerp_string $passwd "[[:lower:]]"; do
        #passwd is global, so we can use it later
	passwd=`cat /dev/urandom | tr -dc 'A-Za-z0-9' | head -c 8`;	
   done
}

while read LINE; do
    #get the fname and lname here, using cut
    fname=`echo $LINE | cut -d, -f 1`;
    lname=`echo $LINE | cut -d, -f 2`;
    
    get_valid_username $fname $lname

    get_good_password

    /usr/sbin/groupadd $username;
    /usr/sbin/useradd -c "$fname $lname" -d /home/$username -g $username -m -s /bin/bash $username;
    echo $passwd | passwd --stdin $username;

    echo "Aadded $fname $lname: $username, $passwd";
    

done