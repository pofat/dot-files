#!/bin/bash
if [ $# -eq 0 ]
then 
    echo "* need a path target *"
    exit
fi

ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++ $*
