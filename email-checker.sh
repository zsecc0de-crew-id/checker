#!/bin/bash
# copyright 2019 ~ widhisec
# dibuat pada tanggal 06/05/2019
# update pada tanggal 28/07/2019
# https://github.com/widhisec
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
NORMAL=$(tput sgr0)
CYAN=$(tput setaf 6)
clear
if [[ -z $(command -v curl) ]]; then
   echo -e "need package curl ✓"
fi
if [[ -z $(command -v grep) ]]; then
   echo -e "need package grep ✓"
fi
main2(){
	 get=$(curl --silent "https://verify-email.org/" -L | grep --text '<meta name="csrf-token" content=".*">' | grep -Po 'content="\K.*?(?=".*)')
         get1=$(curl --silent "https://verify-email.org/home/verify-as-guest/$empas" --compressed --socks5 ${soc} \
         -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:66.0) Gecko/20100101 Firefox/66.0" \
         -H "Accept: application/json, text/plain, */*" \
         -H "Accept-Language: en-US,en;q=0.5" \
         -H "Referer: https://verify-email.org/" \
         -H "X-XSRF-TOKEN: ${get}" \
         -H "Connection: keep-alive" | grep -Po '(?<="response":)(.*?)(?=})' | grep -Po '"log"\s*:\s*"\K([^"]*)')
        printf "[+] $get1 -> $empas \n"
        printf "$get1 | $empas \n" >> ini.txt
        #if [[ $get1 =~ "Success" ]]; then
            #printf "[${GREEN}VALID] ${NORMAL}$empas \n"
            #printf "[VALID] | $empas \n" >> VALID.txt
       #elif [[ $get1 =~ "MailboxDoesNotExist" ]]; then
       	    #printf "[${RED}ERORR] ${NORMAL}$empas"
       #fi
}
sl33p=5
con=1
threads=7
printf "${CYAN}[+]\e[1;92msocks5 mana? = \e[0m"; read soc
printf "${CYAN}[+]\e[1;92mlistny mana? = \e[0m"; read epas
echo -e "${CYAN}[+]\e[1;92mtotal list =${NORMAL}" `wc -l $epas`
if [[ ! -f $epas  ]]; then
    echo "file empas not found [!]"
    exit 1
fi
for empas in $(cat $epas);do
    fast=$(expr $con % $threads)
    if [[ $fast == 0 && $con > 0 ]]; then
       sleep $sl33p
       printf "[loading] \n"
     fi
     main2 "$soc" "$epas" &
done
wait
