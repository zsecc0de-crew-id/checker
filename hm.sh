#!/bin/bash
# widhisec free bro ;)
# need jq -> apt-get install jq -y
H=$(tput setaf 2)
M=$(tput setaf 1)
R=$(tput sgr0)
LIMITATOR="30"
sec='2463478a-0ade-43ad-8152-07070242caed'
function gaskeun(){
agent=$(shuf -n 1 "agent_.i")
gaskeun=$(curl 'https://my.hidemyass.com/LicenseController/activateLicense' -X POST --silent --user-agent "$agent" --insecure \
-H 'Connection: keep-alive' \
-H 'Content-Type: application/json' \
-H 'Accept: */*' \
-H 'Origin: https://my.hidemyass.com' \
-H 'Referer: https://my.hidemyass.com/en-eu/' \
-H 'Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7,tr;q=0.6' \
-H "Cookie: SECURITY_TOKEN=${sec}; s_cc=true; IDT2=IDTN-170483-GSLDkwYphOuoY7QFtoCijVdjHXwwowklxSO35445;" --data-binary '{"correlationId":128,"operationName":"activateLicense","serviceName":"LicenseController","payload":["'"${x}"'"],"securityToken":"'"2463478a-0ade-43ad-8152-07070242caed"'"}' --compressed | jq -r .errorData|jq -r '.[].errorMessage'|cut -d '.' -f5)
printf "${R}%s => %s\n" "$gaskeun" "$x"
}
echo -e "
${M} __                    
|  |__   _____ _____   
|  |  \ /     \\__  \       [ Made by ${R}Widhisec ]
|   Y  \  Y Y  \/ __ \_
${H}|___|  /__|_|  (____  / [ HideMyAss! License Key Checker ]
     \/      \/     \/ 
${R}
"
if [[ ! -f $1 ]]; then
	printf "list not found..\n"
	exit
fi
(
for x in $(cat $1);do
	((thread=thread%LIMITATOR)); ((thread++==0)) && wait
	gaskeun &
done
wait
)
