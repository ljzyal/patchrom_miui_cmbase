#!/bin/bash
#
# $1: dir for original miui app 
# $2: dir for target miui app
#

XMLMERGYTOOL=$PORT_ROOT/tools/ResValuesModify/jar/ResValuesModify
GIT_APPLY=$PORT_ROOT/tools/git.apply
curdir=`pwd`

function applyPatch () {
    for patch in `find $1 -name *.patch`
    do
        cd out
        $GIT_APPLY ../$patch
        cd ..
        for rej in `find $2 -name *.rej`
        do
            echo "Patch $patch fail"
            exit 1
        done
    done
}

function applyPart () {
    for part in `find $1 -name *.part`
    do
        cd out
        $GIT_APPLY ../$part
        cd ..
        for rej in `find $2 -name *.rej`
        do
            echo "Part $patch fail"
            exit 1
        done
    done
}

if [ $1 = "MiuiFramework" ];then
	applyPatch $1 $2
fi