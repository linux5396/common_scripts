#!/bin/bash

# support OS is linux
function help() {
  return 0
}

if [ ! -n "$1" ]; then
  echo "process name is nil"
  exit 1
fi

#收集进程占用句柄数
function collect_proc_fd_num() {
  RESULT=0
  for x in `ps -ef |grep $1 |grep -v "grep" | awk -F ' ' '{print $2}'`
  {
    if [ -d "/proc/$x/fd" ];then
      CNT=`ls -l -a /proc/$x/fd |wc -l`
      RESULT=`expr $CNT + $RESULT`
    fi
  }
# 用户可以自定义一些操作
#  if [ $RESULT -lt 30 ];then
#        echo "lt 30"
#  fi
  echo $RESULT
  return $RESULT
}


collect_proc_fd_num $1
