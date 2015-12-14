#!/bin/bash

i="0"

while [ $i -lt 4 ]
do
echo "FIRE"
printf "AT+CGPSINF=0\r\n" > /dev/ttyUSB0
python json_io.py

sleep 5
done
