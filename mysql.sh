#!/bin/bash
for Jmx in `ls mysql/jmx`
do
	num=`echo $Jmx|awk -F'_' '{print $1}'`
	name=`echo $Jmx|awk -F'[_.]' '{print $2}'`
	Jtl="./mysql/jtl/${num}_${name}.jtl"
#	echo -e "$Jmx $num $Jtl\n"
	if [ -f $Jtl ];then
		continue
	else
		/usr/local/jmeter-4.0/bin/jmeter -n -t ./mysql/jmx/${num}_${name}.jmx -l ./mysql/jtl/${num}_${name}.jtl
	fi
done
git add --all
git commit -m 'test'
git push
