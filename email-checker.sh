#!/bin/bash
# copyright 2019 ~ widhisec
# dibuat pada tanggal 06/05/2019
# https://github.com/widhisec
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
NORMAL=$(tput sgr0)
CYAN=$(tput setaf 6)
if [[ -z $(command -v curl) ]]; then
   echo -e "need package curl ✓"
fi
if [[ -z $(command -v grep) ]]; then
   echo -e "need package grep ✓"
fi
main(){
	 get=$(curl --silent "https://verify-email.org/" -L | grep --text '<meta name="csrf-token" content=".*">' | grep -Po 'content="\K.*?(?=".*)')
         get1=$(curl --silent "https://verify-email.org/home/verify-as-guest/$empas" --compressed --socks5 ${soc} \
         -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:66.0) Gecko/20100101 Firefox/66.0" \
         -H "Accept: application/json, text/plain, */*" \
         -H "Accept-Language: en-US,en;q=0.5" \
         -H "Referer: https://verify-email.org/" \
         -H "X-XSRF-TOKEN: ${get}" \
         -H "Connection: keep-alive" | grep -Po '(?<="response":)(.*?)(?=})' | grep -Po '"log"\s*:\s*"\K([^"]*)')
        printf "[+] $get1 -> $empas \n"
        printf "[VALID] | $empas \n" >> VALID.txt
        #if [[ $get1 =~ "Success" ]]; then
            #printf "[${GREEN}VALID] ${NORMAL}$empas \n"
            #printf "[VALID] | $empas \n" >> VALID.txt
       #elif [[ $get1 =~ "MailboxDoesNotExist" ]]; then
       	    #printf "[${RED}ERORR] ${NORMAL}$empas"
       #fi
}
head(){
printf "${CYAN}[+]\e[1;92msocks5 mana? = \e[0m"; read soc
printf "${CYAN}[+]\e[1;92mlistny mana? = \e[0m"; read epas
printf "${CYAN}[+]\e[1;92mtotal list = `wc -l $epas`\e[0m \n"
if [[ ! -e $epas  ]]; then
    echo "file empas not found [!]"
    exit 1
fi
(
for empas in $(cat $epas); do
    startline=1 ###
    endline="30"
    counter=0
    default_threads="10"
    threads="${30:-${default_threads}}"
    token=$(($counter+1))
    let token++
    let counter++
    let startline+=$threads
    let endline+=$threads
main "$empas" &
done
wait
)
}
head
