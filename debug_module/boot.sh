#!/bin/bash

printf "AT+CGPSPWR=1\r\n" > $1 
sleep 3
printf "AT+CGPSRST=0\r\n" > $1

exit 0