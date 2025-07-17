#!/bin/bash

dir=`ls ../src`
ACGEN=~/Working/devel/ACTest/util/acgen.jl

for d in $dir
do
    echo $d
    cd ../src/$d
    pwd
    $ACGEN act.toml
    cd ..
    tar -czvf $d.tar.gz $d
    cd ../util
done
