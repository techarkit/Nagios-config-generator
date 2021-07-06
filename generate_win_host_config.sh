#!/bin/bash
## Purpose: To Generate Nagios Configuration files within minute of time.
## Author: Ankam Ravi Kumar

mkdir WinServers
echo "Please provide your NSClient Password:"
read pass
cat  serverlist.txt | while read LINE
do
    HostIP=`echo $LINE | cut -d, -f1`
    HostName=`echo $LINE | cut -d, -f2`

NSCLIENTSTATE=$(/usr/local/nagios/libexec/check_nt -H $HostIP -p 12489 -v CLIENTVERSION -s $pass | echo $?)
  if [ $NSCLIENTSTATE -eq 0 ]; then
     sed -e "s/XXXX/$HostName/g; s/ZZZZ/$HostIP/g" Template-Windows.cfg > WinServers/$HostName.cfg

for i in D E F G H I J K L M N O P Q R S T U V W X Y Z;
do
  /usr/local/nagios/libexec/check_nt -H $HostIP -p 12489 -v USEDDISKSPACE -s $pass -l $i -w 90 -c 95
  COMMANDSTATUS=$(echo $?)
    if [ $COMMANDSTATUS -eq 0 ] || [ $COMMANDSTATUS -eq 2 ] || [ $COMMANDSTATUS -eq 1 ];then
      sed -e "s/XXXX/$HostName/g; s/ZZZZ/$i/g" Drives.cfg >> WinServers/$HostName.cfg
    fi
done
fi
done
