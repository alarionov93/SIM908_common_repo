#!/bin/bash

echo "true"
while [[ true ]]; do

printf "AT+CSCLK=2\r\n" > /dev/ttyUSB1

sleep 0

done
