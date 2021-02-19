#!/bin/bash
 
R1=`cat /sys/class/net/eno1/statistics/rx_bytes`
sleep 1
R2=`cat /sys/class/net/eno1/statistics/rx_bytes`
RBPS=`expr $R2 - $R1`
RKBPS=`expr $RBPS / 1024`
echo -e "\x07  $RKBPS kB/s \x01"



