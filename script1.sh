#!/bin/bash

# Checking the number of parameters
if [ "$#" -ne 1 ] ; then
    echo "Error. Illegal number of parameters. Only 1 parameter is allowed"
    exit
fi

MINUTES=$1

# The entered parameter is a digit
RE='^[0-9]+$'
if ! [[ $MINUTES =~ $RE ]] ; then
    echo "Error. Not a number"
    exit 1
fi

# Minutes > 0
if [ "$MINUTES" -le "0" ] ; then
    echo "Error. The number of minutes must be greater than 0"
    exit 1
fi

# Minutes <= 60
if [ "$MINUTES" -gt "60" ] ; then
    echo "The number of minutes must be less than 60 minutes"
    exit 1
fi


SECONDS=$(($MINUTES*60))

#echo "Minutes $MINUTES"
#echo "Seconds $SECONDS"

#while ["$SECONDS" -gt "0" ]
#do
#    echo "There are $SECONDS seconds remaining"
#    let SECONDS--
#    sleep 1
#    #echo "There are $SECONDS seconds remaining"
#done

for ((i=$SECONDS; i>0; i--)); 
do
    echo "There are $i seconds remaining"
    sleep 1
done
echo "The time is over!"

