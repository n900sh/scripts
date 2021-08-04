#!/bin/bash

# Run as root?
#if [ "$EUID" -ne 0 ]
#then
#    echo "This script must be run as root"
#    exit
#fi


#echo "Enter username:"
#read USERNAME

#echo $USERNAME

#if [ "$(grep $USERNAME /etc/passwd)" ];
#then
#    echo "This username is present in the system"
#fi


while :
do
    echo "Enter username:"
    read USRN
    if [[ -z "${USRN}" ]] ; then
	echo "Username must not be empty"
    else
	break 1
    fi
done

if [ "$(cut -d: -f1 /etc/passwd | grep $USRN)" ];
then
    echo "This username is present in the system"
fi


read -sp "Enter password:" PASS
if [[ -z "$PASS"]] ;
then
    echo "The password is empty. Set a password for the user $USRN manually"
fi
#ENCR_PASS=$(openssl passwd -crypt $PASS)

#echo "$ENCR_PASS"

