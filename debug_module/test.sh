#!/bin/bash

echo "true"
while [[ true ]]; do

printf "AT\r\n" > /dev/smd0

sleep 5

done
