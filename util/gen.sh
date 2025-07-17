#!/bin/bash

dir=`ls ../src`

for d in $dir
do
    echo $d
    cd ../src/$d
    pwd
    ~/Working/devel/ACTest/util/acgen.jl act.toml
    cd ..
    pwd
    cd ../util
    pwd
done
