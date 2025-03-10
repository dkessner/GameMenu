#!/bin/bash

if [ $0 != "bash" -a $0 != "-bash" ]
then
    echo Usage: source setpath.sh
    exit 1    
fi

export CLASSPATH=".:$HOME/dev/VideoGameMenu/lib/*"
echo CLASSPATH: $CLASSPATH
