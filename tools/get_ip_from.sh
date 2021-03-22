#!/bin/bash

#Only support on linux
function help() {
  return 0
}

if [ -z $1 ]; then
  echo "input is nil"
  exit 1
fi

function ck_code() {
  if [ $1 -ne 0 ]; then
    echo "run get_ip occurred error"
  fi
}

#从文件中获取ip并且去重
#只提取有效的ipv4地址
function get_ip() {
  grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)' $1 |sort -d |uniq
  return $?
}

get_ip $1
ck_code $?
