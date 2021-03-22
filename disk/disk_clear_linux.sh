#!/bin/bash

#Only support on linux
function help() {
  return 0
}
#指定目录
Dir=$1
#多少分钟以前的文件
BeforePastMinutes=$2
#文件的表达式
FileRegex=$3

if [ -z $Dir ]; then
  echo "clearDir is nil"
  exit 1
fi
if [ -z $BeforePastMinutes ]; then
  echo "the before past minutes is nil"
  exit 1
fi
if [ -z $FileRegex ]; then
  echo "the file regex is nil"
  exit 1
fi

function ck_code() {
  if [ $1 -ne 0 ]; then
    echo "run clearDir occurred error"
  fi
}

#清理目录下的文件，需要具备执行权限
function clearDir() {
  cd $1
  find $1 -name "$3" -mmin +$2 -exec rm {} \;
}

clearDir $Dir $BeforePastMinutes $FileRegex
ck_code $?
