#!/bin/bash

#
# This script will try to generate the dataset. To use this script, user
# must make sure that:
#
# (1) Please install and configure the ACTest toolkit correctly.
#     The environment variable ACTEST_HOME must be setup or ACTest was
#     installed via Julia's package manager.
#
# (2) The environment variable ACTEST must be correctly setup.
#     Be careful, ACTEST and ACTETS_HOME are different.
#
# (3) Please execute the clean.sh script to clean the directory at first.
#     The clean.sh script is in the actd/util directory as well.
#
# (4) Please ensure that your system has enough disk space.
#     At least 200GB empty disk space is required.
#
# (5) Please execute this script in the util directory.
#     It takes about 1 hour.
#

# A collection of working directories
dir=`ls ../src`

# Scripts for generating the dataset
ACGEN=$ACTEST/util/acgen.jl
ACMAT=$ACTEST/util/acmat.jl

# For offdiagonal Green's functions
OFFSTR="offdiag"

for d in $dir
do
    echo $d

    # If it is a file, then we check next item.
    if test -f ../src/$d
    then
        continue
    else
        # Enter the working folder
        cd ../src/$d
        pwd
    fi

    # We use run.txt to control whether the current folder is used.
    if test -f run.txt
    then
        cd ../../util
        continue
    else
        # Mark the current folder is used
        date > run.txt

        # Extract random number seed
        myseed=`cat seed`

        # Generate dataset
        if [[ $d =~ $OFFSTR ]]
        then
            $ACMAT act.toml $myseed > dataset.txt
        else
            $ACGEN act.toml $myseed > dataset.txt
        fi

        # Mark the current job is finished
        date >> run.txt

        # Compress dataset
        cd ..
        tar -czvf $d.tar.gz $d

        # Return the parent directory
        cd ../util
    fi
done
