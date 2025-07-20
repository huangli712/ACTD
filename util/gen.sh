#!/bin/bash

#
# This script will try to generate the dataset. To use this script, please
# make sure:
#
# (1) The environment variable ACTEST must be correctly setup.
#
# (2) Please execute the clean.sh script to clean the directory at first.
#
# (3) Please ensure that your system has enough disk space.
#

dir=`ls ../src`
ACGEN=$ACTEST/util/acgen.jl
ACMAT=$ACTEST/util/acmat.jl
OFFSTR="offdiag"

for d in $dir
do
    echo $d
    cd ../src/$d
    pwd
    if [[ $d =~ $OFFSTR ]]
    then
        $ACMAT act.toml > dataset.txt
    else
        $ACGEN act.toml > dataset.txt
    fi
    cd ..
    tar -czvf $d.tar.gz $d
    cd ../util
done
