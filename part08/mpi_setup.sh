#!/bin/bash

export PATH=$PWD/bin:$PATH

if [[ "$HOSTNAME" == *stampede* ]]
then
    echo "XSEDE/Stampede"
    module load mvapich2
    cd bin/
    make clean; make
    cd ..

elif [[ "$HOSTNAME" == *blacklight* ]]
then
    echo "XSEDE/Blacklight"
    module load ImageMagick/6.7.3-10

elif [[ "$HOSTNAME" == *workflow.iu.xsede.org* ]]
then
    export STAMPEDE_HOME=$(ssh stampede.tacc.xsede.org pwd)
    #export GORDON_HOME=$(ssh gordon.sdsc.xsede.org pwd)
    export BLACKLIGHT_HOME=$(ssh blacklight.psc.xsede.org pwd)
else
    SWIFT=$PWD/swift-trunk/bin
    export PATH=$SWIFT:$PWD/bin:$PATH
    module load openmpi
    module load ffmpeg
    cd bin; make; cd ..
fi



