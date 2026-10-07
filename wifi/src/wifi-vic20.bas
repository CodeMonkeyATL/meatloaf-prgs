10 dr=peek(250):if dr > 15 then dr=peek(186)
20 if dr=0thendr=30
30 rh=1
40 gosub20100
50 print chr$(147);chr$(142);
60 gosub10000

200 x=fre(0):bi$=" choose your option"
210 bc=1:gosub20000
220 bi$=left$(sp$,3)+"w g i s f r q ?"
230 bc=4:gosub20000
240 geta$
250 ifa$="g"thengosub4100:goto200
260 ifa$="i"thengosub4200:goto200
270 ifa$="s"thengosub4400:goto200
280 ifa$="r"thengosub3150:goto200
290 ifa$="q"thenprint chr$(147);"{blu}":end
300 ifa$="f"thengosub4300:goto200
310 ifa$="w"thengosub1000:goto200
320 ifa$="?"thengosub10000:gosub4500:goto200
330 goto240

1000 printchr$(147);chr$(14):bt=1:gosub4100:gosub4200:gosub4400
1100 sn$="":print:print"enter new wifi ssid":inputsn$
1110 pn$="":print"enter new wifi pass":inputpn$
1120 gosub3050:print:gosub3400
1126 ifrt$="y"thengoto1000
1127 ifrt$<>"y"thenprintchr$(142):goto1150
1130 gosub3000:print"set wifi ssid to:":print" {blk}";sc$;"{blu}"
1140 gosub3100:print;left$(sp$,9)+"wifi ip:":print" {blk}";ip$;"{blu}": print
1150 bt=0:printchr$(147):gosub10000:return

3000 if rh then 3020
3010 sc$="testssid":return
3020 open1,dr,15,"getssid":input#1,sc$:close1:return

3050 if rh then 3070
3060 return
3070 open1,dr,15,"setssid:"+sn$+","+pn$:close1:return

3100 if rh then 3120
3110 ip$="12.12.12.12":return
3120 open1,dr,15,"localip":input#1,ip$:close1:return

3150 bi$="meatloaf reset:":bc=1:gosub20000
3160 bi$="  command sent":bc=4:gosub20000:return

3200 if rh then 3220
3210 s=5:return
3220 open1,dr,15,"scan":input#1,s:close1:return

3250 if rh then 3270
3260 s$="access-point<"+str$(x)+">":return
3270 z$="scanresult,"+str$(x)
3280 open1,dr,15,z$:input#1,r$,s$:close1:return

3300 if rh then 3320
3310 em$="v1.2.3":return
3320 open1,dr,15,"i:":input#1,en,em$,et,es:close1:return

3400 gosub3000:ifsc$=sn$thenprint"{red}ssid set success!{blu}":return
3420 ifsc$<>sn$thengosub3600:return

3600 bi$="{reverse on}{red}ssid set failed!{blu}{reverse off}":bc=2:bp=4:gosub20000
3610 print"current ssid:":print"{blk}";sc$;"{blu}"
3620 print"requested ssid:":print"{blk}";sn$;"{blu}":print
3620 gosub3800:return

3800 bi$="{blu}try again? (y/n) {blu}":bc=2:bp=2:gosub20000
3820 gets$
3830 ifs$="y"thenrt$="y":return
3830 ifs$="n"thenrt$="n":return
3840 goto3820

4100 gosub3000:bi$="current ssid:":bc=1:gosub20000
4120 bi$=sc$:bc=4:gosub20000:return

4200 gosub3100:bi$="current ip:":bc=1:gosub20000
4220 bi$="   "+ip$:bc=4:gosub20000:return

4300 gosub3300:bi$="fw version:":bc=1:gosub20000
4320 iflen(em$)<=19thenbi$=em$:goto4340
4335 bi$=chr$(95)+right$(em$,19)
4340 bc=4:gosub20000:return

4400 bi$="scanning wifi aps...":bc=2:gosub20000
4420 gosub3200:print"{reverse off}{red}";:forx=0tos:gosub3250:prints$:next:print"{blu}"
4430 return

4500 print"{blk}w{blu}:set wifi ssid/pass"
4520 print"{blk}g{blu}:get wifi ssid"
4530 print"{blk}i{blu}:ip address"
4540 print"{blk}s{blu}:scan wifi aps"
4550 print"{blk}f{blu}:get ml fw version"
4560 print"{blk}r{blu}:reset ml"
4570 print"{blk}q{blu}:quit"
4580 print"{blk}?{blu}:show help"
4590 print:return

4700 bi$="  wifi ssid config"
4710 bc=1:gosub20000
4720 bi$=left$(sp$,4)+"by -deadline-"
4725 bc=3:gosub20000
4730 bi$=">github.com/cityxen"
4725 bc=3:gosub20000
4740 bi$=" /meatloaf-prgs/wifi"
4725 bc=4:gosub20000
4750 return

10000 rem 
10001 l$=chr$(223):r$=chr$(233):sp$="                      "
10010 printchr$(147);"{blk}";:bt=0
10020 rem 
10030 bi$=l$+"{reverse on}   {reverse off}"+r$+"{reverse on}{cyan} {blk}{reverse off}"
10040 bi$=bi$+"meatloaf wifi":bc=1:bp=1:gosub20000
10050 rem 
10060 bi$=" "+l$+"{reverse on} {reverse off}"+r$+" "+"{reverse on}{green} {blk}{reverse off}"
10070 bi$=bi$+" by -deadline-":bc=3:bp=0:gosub20000
10080 rem 
10090 bi$ = "  {reverse on} {reverse off}  {reverse on}{yellow} {blk}{reverse off}"
10100 bi$=bi$+"github/cityxen":bc=3:bp=0:gosub20000
10110 rem 
10120 bi$ = "  {reverse on} {reverse off}  {reverse on}"+chr$(156)+" {blk}{reverse off}"
10130 bi$=bi$+"/meatloaf-prgs":bc=3:bp=0:gosub20000
10140 rem 
10150 bi$="  {reverse on} {reverse off}  {reverse on}{red} {blk}{reverse off}"
10160 bi$=bi$+"/wifi-vic20":bc=4:bp=3:gosub20000
10170 return

20000 ifbc=1orbc=2thengosub21100
20010 ifbc=1orbc=2orbc=3orbc=4thengosub21500
20020 ifbc=2orbc=4thengosub21200
20030 bc=0
20040 return
20100 bt=0
20110dimbx$(15)
20120data117,96,105,106,96,107,98,125,176,96,174,173,96,189,179,171
20140fort=0to15:readx:bx$(t)=chr$(x):nextt:return
21100printbx$(bt*8+0);:fori=1to20:printbx$(bt*8+1);:nexti:printbx$(bt*8+2);:return
21200printbx$(bt*8+3);:fori=1to20:printbx$(bt*8+4);:nexti:printbx$(bt*8+5):return
21500p=20-len(bi$):ifp<0thenp=0
21505p=p+bp:bp=0
21510printbx$(bt*8+6);bi$;spc(p);bx$(bt*8+7);:return