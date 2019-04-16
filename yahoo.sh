#!/bin/bash
# @plase not recode script me ;) *\\
# @create on  : ^17-04 -2019 *\\
# @jam : 00.07
# @powered by : ^zsecc0de-crew.id *\\
clear;
command -v curl > /dev/null 2>&1 || { echo >&2 "cURL not installed [!]"; }
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
NORMAL=$(tput sgr0)
CYAN=$(tput setaf 6)
function menu () {
printf "
\t[-] Yah00 CheckeR
\t[-] jika ada masalah hubungi saya di https://t.me/Mr_28dh8
"
}
menu
function datas () {
                 cURL=$(curl -s http://widhitools.000webhostapp.com/api/yahoo.php? --data "email=$x" | 
                 jq -r .status)
                 echo "$x > $cURL" >> Yah00.txt
                 printf "${CYAN}[*] ${NORMAL}$x > ${GREEN}$cURL \n"
}
function 0x0x () {
                 echo -n "list:"; read lis
                 for x in `cat $lis`; do
	                 datas %70
	             done
}
0x0x
