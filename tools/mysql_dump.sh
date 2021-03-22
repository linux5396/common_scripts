#!/bin/bash

#Only support on linux
function help() {
  return 0
}
#get current time
DATE=$(date "+%Y-%m-%d_%H_%M_%S")
# databases name
DBN=$1
# output data path
DTP=$2

if [ -z $DBN ]; then
  echo "database name is nil"
  exit 1
fi
if [ ! -d $DTP ]; then
  echo "output data path is nil"
  exit 1
fi

#创建按时间分区的目录
mkdir "$DTP/$DATE"
#用户修改以下几个参数后再使用，为了安全性，避免在调用脚本时将以下几个相关隐私参数作为外参
mysqldump -u${USERNAME} -p${PSW} -h${HOST} -P${PORT} --databases $DBN >> "$DTP/$DATE/$DBN.sql"

echo "list file in $DTP/$DATE"

ls -l -a "$DTP/$DATE"
