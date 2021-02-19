#!/bin/bash
 
T1=`cat /sys/class/net/eno1/statistics/tx_bytes`
sleep 1
T2=`cat /sys/class/net/eno1/statistics/tx_bytes`
TBPS=`expr $T2 - $T1`
TKBPS=`expr $TBPS / 1024`
echo -e "\x07  $TKBPS kB/s \x01"



