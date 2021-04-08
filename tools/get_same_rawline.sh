#!/bin/bash

file1=$1
file2=$2


if [ ! -n "$file1" ]
then
        echo "file1 is nil"
        exit
fi

if [ ! -n "$file2" ]
then
        echo "file2 is nil"
        exit
fi


grep -wf $file1 $file2