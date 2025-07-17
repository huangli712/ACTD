#!/bin/bash

dir=`ls ../src`

for d in $dir
do
    echo $d
    cd ../src/$d
    pwd
    rm -fr green.*
    rm -fr image.*
    cd ../../util
done
