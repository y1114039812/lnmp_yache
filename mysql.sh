#!/bin/bash
for Jmx in `ls mysql/jmx`
do
	num=`echo $Jmx|awk -F'_' '{print $1}'`
	Jtl="./mysql/jtl/${num}_jdbc.jtl"
#	echo -e "$Jmx $num $Jtl\n"
	if [ -f $Jtl ];then
		continue
	else
		/usr/local/jmeter-4.0/bin/jmeter -n -t ./mysql/jmx/${num}_jdbc.jmx -l ./mysql/jtl/${num}_jdbc.jtl
	fi
done
git add --all
git commit -m 'test'
git push
