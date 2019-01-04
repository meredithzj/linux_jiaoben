#!/bin/bash
n=`cat 1.txt|wc -l`
for i in `seq 1 $n`
do
user_1=`sed -n "$i"p /root/jiaoben1/expect/2.txt |awk -F":" '{print $1}'`
ip_1=`sed -n "$i"p  /root/jiaoben1/expect/2.txt |awk -F":" '{print $2}'`
passwd_1=`sed -n "$i"p /root/jiaoben1/expect/2.txt|awk -F":" '{print $3}'`
./3.exp $user_1 $ip_1 $passwd_1
done
