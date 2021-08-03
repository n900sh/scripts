#!/bin/bash

# Run as root?
#if [ "$EUID" -ne 0 ]
#then
#    echo "This script must be run as root"
#    exit
#fi


echo "Enter username:"
read USERNAME

echo $USERNAME

if [ "$(grep $USERNAME /etc/passwd)" ];
then
    echo "This username is present in the system"

fi






