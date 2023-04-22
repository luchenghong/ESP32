#!/bin/bash
#insert filename
echo $1
nc -lp 8801 > $1"p1" &
nc -lp 8802 > $1"p2" &
start=$(($(date +%s%3N)))
p8801=$(ps -aef | grep n[c]\ -lp\ 8801 | awk '{print $2}')
p8802=$(ps -aef | grep n[c]\ -lp\ 8802 | awk '{print $2}')
echo $p8801
r="abc"
count=0
echo $1 > $1"marks"
while [[ $r != "exit" ]];
do
	read -p "exit to exit or entry anyting to cut the data" r 
	count=$(($count+1))
	echo $r
	now=$(($(date +%s%3N)))
	ret=$(($now-$start))
	echo "note:"$r >> $1"marks"
	echo $ret >> $1"marks"
	echo $count
	ls -la | grep $1
done
	echo "exiting...\n"
	now=$(($(date +%s%3N)))
	ret=$(($now-$start))
	echo $ret >> $1"marks"
	kill $p8801
	kill $p8802
	echo "killed pid :$p8801"
	echo "killed pid :$p8802"

