#!/usr/bin/env bash

count=0

cd $1

for i in `ls $1`;
do
    cd $i

    echo ""
    echo + $i

    git pull

    ((count++))

    cd ..;
done

echo ""
echo "Done updating" $count "projects"
echo ""
