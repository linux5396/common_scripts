#!/bin/bash

#Only support on linux

function help() {
  return 0
}

FilePath=$1
if [ -z $FilePath ]; then
  echo "file path is nil"
  exit 1
fi

#截断文件：用于保留文件，但是清理磁盘空间；或者进程仍在运行中，用rm并不释放的场景
function file_truncate() {
    if [ -f $1 ]; then
      truncate -s 0 $1
    else
      echo "file is not exits"
      return 1
    fi
}

function ck_code() {
  if [ $1 -ne 0 ]; then
    echo "run truncate file20 occurred error"
  fi
}

file_truncate $FilePath
ck_code $?
