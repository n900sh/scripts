#!/bin/bash

# Run as root?
if [ "$EUID" -ne 0 ]
then
    echo "Please run as root"
    exit
fi



# Checking the number of parameters
if [ "$#" -ne 1 ] ; then
    echo "Error. Illegal number of parameters. Only 1 parameter is allowed"
    exit
fi





#OSNAME=$(lsb_release -i | cut -f 2-)

#echo "OS is: $OSNAME"

#NEEDTOINSTALL=$1

#echo "Need to install $NEEDTOINSTALL"

# Checking type of distro
if [ "$(grep "debian" /etc/os-release)" ];
then
    cat $1 | while read line
    do
	echo "Line $count: $line"
	apt-get install $line
	count=$(( $count + 1 ))
    done
elif ["$(grep "centos" /etc/os-release)" ];
then
    cat $1 | while read line
    do
	echo "Line $count: $line"
	yum install $line
	count=$(( $count + 1 ))
    done
else
    echo "Unknown Linux distribution"
    exit
fi





echo "Finished"


