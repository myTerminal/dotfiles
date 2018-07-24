#!/bin/bash

cd $1
for i in `ls $1`;
do
    cd $i
    echo ""
    echo + $i
    git pull
    cd ..;
done
echo ""
