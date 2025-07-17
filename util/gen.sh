#!/bin/bash

dir=`ls ../src`
ACGEN=~/Working/devel/ACTest/util/acgen.jl
ACMAT=~/Working/devel/ACTest/util/acmat.jl
OFFSTR="offdiag"

for d in $dir
do
    echo $d
    cd ../src/$d
    pwd
    if [[ $d =~ $OFFSTR ]]
    then
        $ACMAT act.toml
    else
        $ACGEN act.toml
    fi
    cd ..
    tar -czvf $d.tar.gz $d
    cd ../util
done
