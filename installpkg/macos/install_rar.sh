#!/bin/bash

#browser this page https://www.rarlab.com/download.htm
#choose the version which is suitable for your pc
#such as :rarosx-6.0.1b1.tar.gz

REPO="rarosx-6.0.1b1.tar.gz"

wget https://www.rarlab.com/rar/$REPO
tar -zxvf $REPO
cd rar
#base on admin
sudo install -c -o $USER rar /usr/local/bin/
sudo install -c -o $USER unrar /usr/local/bin/

function checkCode() {
  if [ $? -ne 0 ]; then
    echo "installed failed"
    exit 1
  fi
}
#test
function testInstalled() {
  rar
  checkCode
  unrar
  checkCode
}
#after installed
testInstalled
