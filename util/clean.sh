#!/bin/bash

#
# This script will clean the src directory, removing all the green.* and
# image.* files. 
#
# This script is extremely dangerous. please use it at your own risk!
#

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
