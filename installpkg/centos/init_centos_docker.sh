#!/bin/bash

#以下脚本用于初始化centos容器
#并且提供ssh的对外链接服务
yum install -y openssh-server vim lrzsz wget gcc-c++ pcre pcre-devel zlib zlib-devel ruby openssl openssl-devel patch bash-completion zlib.i686 libstdc++.i686 lsof unzip zip
yum install initscripts
yum install net-tools.x86_64
yum install openssh-server
yum install passwd
service sshd restart
vim /etc/ssh/sshd_config
#打开注释 PermitRootLogin yes, 允许密码登录,保存退出
passwd root
