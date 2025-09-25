#!/bin/bash

#
# This script will clean the src directory, removing all the green.* and
# image.* files. You have to execute it in the util directory.
#
# This script is extremely dangerous. Please use it at your own risk! We
# strongly suggest you to remove the useless files manually.
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
