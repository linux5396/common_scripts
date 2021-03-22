#!/bin/bash

# support OS linux
function help() {
  return 0
}

if [ ! -n "$1" ]; then
  echo "process name is nil"
  exit 1
fi

procName=$1
# 修改为对应进程的启动命令
procStartCmd=/bin/bash ls

#通过进程名检查进程是否存在，不存在则使用进程启动命令拉起进程
function ck_procName() {
  ps -ef | grep $1 | grep -v "grep"| grep -v "ck_proc_name_linux.sh"
  if [ -$? -ne 0 ]; then
    $($2)
  else
    echo "process already exists."
  fi
}
#第一次检查
ck_procName $procName $procStartCmd
#第二次检查
ck_procName $procName $procStartCmd
