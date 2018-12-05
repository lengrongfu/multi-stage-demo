#! /bin/bash
#sed 's/要被取代的字串/新的字串/g'
sed 's/\"port\":80/\"port\":\"${PORT}\"/g' 
#sed -i "s/\"host\": \"127.0.0.1\"/\"host\": \"${ORANGE_HOST}\"/g" ${ORANGE_CONF}
#数据的搜寻并执行命令
# 如果只替换/etc/passwd的第一个bash关键字为blueshell，就退出
#sed -n '/bash/{s/bash/blueshell/;p;q}' 
