#!/bin/bash

echo "true"
while [[ true ]]; do

printf "AT\r\n" > /dev/ttyUSB0

sleep 5

done
