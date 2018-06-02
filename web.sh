#!/bin/bash
for Jmx in `ls web/jmx`
do
	num=`echo $Jmx|awk -F'_' '{print $1}'`
	Jtl="./web/jtl/${num}_jdbc.jtl"
#	echo -e "$Jmx $num $Jtl\n"
	if [ -f $Jtl ];then
		continue
	else
		/usr/local/jmeter-4.0/bin/jmeter -n -t ./web/jmx/${num}_jdbc.jmx -l ./web/jtl/${num}_jdbc.jtl
	fi
done
git add --all
git commit -m 'test'
git push
