#!/bin/bash
#网络ip地址提取
#by meredith at 2019.1.3
#export PATH=$PATH
IPV4=`ifconfig|awk 'NR==2{print$2}'`
IPV6=`ifconfig|awk 'NR==3{print$2}'`
WK=`ifconfig|awk 'BEGIN {FS="[ :]"} NR==1{print$1}'`
echo -e "\033[31m1:网卡名称:\033[0m\t$WK "
echo -e "\033[31m2:IP:\033[0m\t$IPV4 "
echo -e "\033[31m3:IP6:\033[0m\t$IPV6 "
