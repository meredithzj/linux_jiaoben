#!/bin/bash
#改脚本为用户查看，添加，删除。
#by meredith at 2019.1.3

#查看用户和UID
function chakan_1() {
cat -n /etc/passwd|awk -F":" '{print$1"."$3}'

}


#添加用户
function add_1() {
read -p"输入要添加的用户:" YH
id $YH  &>/dev/null
panduan_1=`echo $?`
mima_1=`echo $RANDOM|md5sum|cut -b 5-10` 
if [ $panduan_1 -ne 0 ]
  then
useradd $YH 
echo "$mima_1"|passwd --stdin $YH >/dev/null
echo "用户$YH创建生成，随机密码为$mima_1"
echo "$YH"-"$mima_1" >>/root/mima/mima.txt
  else
echo "用户已经存在"
fi
}

#删除用户
function del_1() {
read -p"输入要删除的用户:" SCYH
id $SCYH >/dev/null
panduan_1=`echo $?`
mima_1=`echo $RANDOM|md5sum|cut -b 5-10`
if [ $panduan_1 -eq 0 ]
 then
userdel -r $SCYH
echo "用户$SCYH删除成功."
 else
echo "用户不存在"
fi
}




main () {
cat <<EOF
###########1.显示用户列表########################
###########2.添加用户并生成随机密码##############
###########3.删除用户############################
###########4.退出################################
EOF
while true
do
read -p"输入选项数字:" SZ
case $SZ in
1)
chakan_1
continue
;;
2)
add_1
;;
3)
del_1
;;
4)
exit 0
;;
*)
echo "输入1.2.3.4"
esac
done
}
main
