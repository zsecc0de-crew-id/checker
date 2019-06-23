#!/bin/bash
# @plase not recode script me ;) *\\
# @create on  : ^17-04 -2019 ~ jam : 00.07
# @powered by : ^zsecc0de-crew.id *\\
clear;
command -v curl > /dev/null 2>&1 || { echo >&2 "cURL not installed [!]"; }
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
NORMAL=$(tput sgr0)
CYAN=$(tput setaf 6)
lIMIT=15
function menu () {
printf "
\t[-] Yah00 CheckeR
\t[-] jika ada masalah hubungi saya di https://t.me/Mr_28dh8
"
}
menu
function datas(){
                 cURL=$(curl --silent "http://widhitools.000webhostapp.com/api/yahoo.php?email=$x" --socks5 $soc | 
                 grep -Po '(?<="status":)(.*?)(?=})' | tr -d '""')
                 if [[ $cURL =~ "die" ]]; then
                 echo "$x" >> die.txt
                 printf "${CYAN}[*] ${NORMAL}$x > ${RED}$cURL \n"
else
                 echo "$x > $cURL" >> $file
                 printf "${CYAN}[*] ${NORMAL}$x > ${GREEN}$cURL \n"
fi
}
	         echo -n "[?] simpan : "; read file
	         echo -n "- socks:"; read soc
                 echo -n "- list:"; read lis
                 if [[ ! -f $lis ]]; then
                 	printf "list not found \n"
                 	exit 1
                 fi
(
                 for x in `cat $lis`; do
                     ((i=i%lIMIT)); ((i++==0)) && wait
	                 datas "$soc" "lis" "$cURL"
	             done
	             wait
)

