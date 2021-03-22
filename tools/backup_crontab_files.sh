#!/bin/bash

#Only support on linux
function help() {
  return 0
}

if [ ! -d $directory ]; then
  echo "save directory is not exit."
  exit 1
fi

#this tool can be used to backup crontab files
function backup_crontab() {
  if [ -d /var/spool/cron ]; then
    cp -r -p /var/spool/cron $1
    return $?
  else
    echo "crontab files dir /var/spool/cron is not exist."
    return 1
  fi
}

backup_crontab $1
