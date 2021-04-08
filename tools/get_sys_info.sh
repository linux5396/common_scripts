#!/bin/bash

echo "----This Tool Helps Get System Information In linux/unix----"

echo "***CPU List:"
echo "physical cpu numbers:"
grep 'physical id' /proc/cpuinfo | sort -u

echo "core numbers:"
grep 'core id' /proc/cpuinfo | sort -u | wc -l

echo "thread numbers:"
grep 'processor' /proc/cpuinfo | sort -u | wc -l
 

echo "***Memory List:"
/proc/meminfo

echo "***NetStat List:"


echo "***System Up:"

uptime

echo "***Disk State:"

df -h
