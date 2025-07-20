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
    if test -f ../src/$d
    then
        rm -fr ../src/$d
    else
        cd ../src/$d
        pwd
        rm -fr green.*
        rm -fr image.*
        rm -fr dataset.txt
        cd ../../util
    fi
done
