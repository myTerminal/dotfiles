#!/bin/bash

cd $1
for i in `ls $1`;
do
    cd $i
    git pull origin master
    cd ..;
done
