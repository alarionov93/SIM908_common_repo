#!/bin/bash

while [ true ]
do

echo "Measuring battery on SIM 908..."

echo "Getting GPS..."
printf "AT+CGPSINF=0\r\n" > /dev/ttyUSB0
#parsing string here
sleep 5
echo "Sending HTTP..."
# printf "AT+HTTPINIT\r\n" > /dev/ttyUSB0
# sleep 20
printf 'AT+HTTPPARA="CID",1\r\n' > /dev/ttyUSB0
sleep 10
printf 'AT+HTTPPARA="URL","http://a-larionov.ru:2222/data_parser.php?latitude=58.02823135&longitude=56.31131053"\r\n' > /dev/ttyUSB0
sleep 10
printf 'AT+HTTPPARA="CONTENT","application/x-www-form-urlencoded"\r\n' > /dev/ttyUSB0
sleep 10
printf "AT+HTTPACTION=0\r\n" > /dev/ttyUSB0
sleep 50
# printf "AT+AT+HTTPTERM\r\n" > /dev/ttyUSB0
# sleep 5
echo "Measuring battery..."
printf "AT+CBC\r\n" > /dev/ttyUSB0
# python json_io.py

sleep 240
done
