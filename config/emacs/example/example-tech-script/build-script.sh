#!/usr/bin/bash
target=$1
type=$2
releaseVersion=$3
debugVersion=$4

if [[ ${type,,} = "debug" ]]; then
    version=$debugVersion
else
    version=$releaseVersion
fi


echo "Building $type $target app on v$version"
