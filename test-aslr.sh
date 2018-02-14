#!/bin/bash

addr1=`cat /proc/self/maps | grep heap | awk -F'-' '{print $1}'`
addr2=`cat /proc/self/maps | grep heap | awk -F'-' '{print $1}'`

if [[ $addr1 == $addr2 ]];then
    echo 'ASLR DISABLED'
    exit 1
else
    echo 'ASLR ENABLED'
    exit 0
fi
