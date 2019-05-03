#!/bin/bash
# (c) zsecc0de-crew.id ~ widhisec
# jangan recode ya tolong hargai pembuatnya
clear;
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
NORMAL=$(tput sgr0)
CYAN=$(tput setaf 6)
LIMITATOR=30
timex=$(set `date` && echo -e "$5" | cut -d : -f1,2);
check(){
wget -q --spider http://google.com
if [ $? -eq 0 ]; then
    echo -e "${GREEN}[+] ${NORMAL}online ..."
else
    echo "${CYAN}hidupkan koneksi internet ${RED}!!"
fi
}
scan(){
wid=$(curl -X POST 'https://www.ip-tracker.org/checker/email-lookup.php' --silent --socks5 ${soc} \
     -H 'authority: www.ip-tracker.org' \
     -H 'pragma: no-cache' \
     -H 'cache-control: no-cache' \
     -H 'origin: https://www.ip-tracker.org' \
     -H 'upgrade-insecure-requests: 1' \
     -H 'content-type: application/x-www-form-urlencoded' \
     -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36' \
     -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' \
     -H 'referer: https://www.ip-tracker.org/checker/email-lookup.php' --data "email=$x" --compressed | grep -o "<br />.*</div>" | cut -d "<" -f9 | grep -Po "br.*" | gawk -F / '{ print $2 }' | tr -d ">")  
     if [[ $wid =~ "a valid deliverable e-mail box address." ]]; then
         echo "[VALID] = $x" >> valid.txt
         printf "${GREEN}[VALID] = ${NORMAL}$x ~ $timex\n"
     else
         printf "${RED}[DIE] = ${NORMAL}$x\n"
     fi
}
check
echo -en "${RED}[?] ${NORMAL}socks5 here : "; read soc
echo -en "${RED}[?] ${NORMAL}empas here :"; read empas
if [[ ! -f $empas ]]; then
   printf "${RED}[!] ${NORMAL}file not found \n"
   exit
fi       
#startline=30
#endline="12"
#sed -n ''$startline','$endline'p' $empas
for x in $(cat $empas); do
    startline=1 ###
    endline="$threads"
    counter=0
    default_threads="10"
    threads="${15:-${default_threads}}"
    token=$(($counter+1))
    let token++
    let counter++
    let startline+=$threads
    let endline+=$threads
    scan "{$x}" & wait
  done
  wait