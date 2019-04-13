#!/bin/bash
clear;
OK="echo"
command -v curl > /dev/null 2>&1 || { echo >&2 "kamu belum install curl nya"; exit 0; }
#warna
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
NORMAL=$(tput sgr0)
trap ctrl_c INT
function ctrl_c() {
echo -n "Pencet Enter Untuk Keluar..." 
read klur
exit 1;
}
banner()
{
$OK "
$GREEN
 ***
 ** **
**   **
**   **         ****
**   **       **   ****
**  **       *   **   **
 **  *      *  **  ***  **
  **  *    *  **     **  *
   ** **  ** **        **
   **   **  **
  *           *
 *             *
*    0     0    *
*   /   @   \   *
*   \__/ \__/   *
  *     W     *
    **     **
      *****
$RED
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
(CREATE BY WIDHISEC)
(CHACK MAIL) $CYAN
${WHITE}(CONTACT : widhi@programmer.net)
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"
printf "(?) LIST : " 
read kplist;
wget -q --spider http://google.com
if [ $? -eq 0 ]; then
    echo "STATUS : Online"
else
    echo "STATUS : Offline"
fi
printf "Pasikan Koneksi Lancar..\n"
}
banner
data() {
	  versi=full
    hmz="email=$i"
    GET="https://api.2ip.me/email.txt?$hmz"
	  URL=$(curl $GET -s --compressed)
	if [[ $URL =~ "true" ]]; then
		printf "${GREEN}(^ VALID ^) => $i\n";
		echo "$i => $URL" >> VALID.txt
	#ZZ
	elif [[ $URL  =~ '"false"' ]]; then
		printf "${RED}! NOT VALID => $i\n"
	else
		printf "${NORMAL}! ERORR \n"
fi
}
if [ ! -f $kplist ]; then
	printf "${RED}$empaz Not found\n"
	exit
fi
for i in $(cat $kplist)
do
data
done
#DONE
