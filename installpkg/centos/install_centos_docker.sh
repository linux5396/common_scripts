#!/bin/bash

PORT=$1
CTRName=$2
if [ -z $PORT ]; then
  echo "Mapping Port Is Nil"
  exit 1
fi
if [ -z $CTRName ]; then
    echo "Container Name Is Nil"
    exit 1
fi


docker pull centos

docker run -d -p $PORT:22 --name $CTRName --privileged=true centos:latest /usr/sbin/init


