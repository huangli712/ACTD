#!/bin/bash

#
# This script will try to generate the dataset. To use this script, please
# make sure:
#
# (1) Please install and configure the ACTest toolkit correctly.
#
# (2) The environment variable ACTEST must be correctly setup.
#
# (3) Please execute the clean.sh script to clean the directory at first.
#
# (4) Please ensure that your system has enough disk space.
#
# (5) Please execute this script in the util directory.
#

# Working directory
dir=`ls ../src`

# Scripts for generating the dataset
ACGEN=$ACTEST/util/acgen.jl
ACMAT=$ACTEST/util/acmat.jl

# For offdiagonal Green's functions
OFFSTR="offdiag"

for d in $dir
do
    echo $d
    cd ../src/$d
    pwd
    myseed=`cat seed`
    if [[ $d =~ $OFFSTR ]]
    then
        $ACMAT act.toml $myseed > dataset.txt
    else
        $ACGEN act.toml $myseed > dataset.txt
    fi
    cd ..
    tar -czvf $d.tar.gz $d
    cd ../util
done
