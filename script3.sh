#!/bin/bash

# Run as root?
if [ "$EUID" -ne 0 ]
then
    echo "Please run as root"
    exit
fi






