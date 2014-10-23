#!/bin/bash

find_rm ()
{
    # [[ -d "~/.log/" ]] || mkdir ~/.log
    find -H "$1" -iname "*conflicted copy*" -print -delete 
    # another alternatives
    #find -H "$1" -name "*conflicted copy*" -exec rm -vf {} \;
    #find -H "$1" -name "*conflicted copy*" -execdir rm -vf {} +
    #find -H "$1" -name "*conflicted copy*" -execdir mv -t "~/case_conflict_from_dropbox" -vf {} +
}

dropbox_paths=(
    "${HOME}/Dropbox"                                   
)

for idx in ${!dropbox_paths[@]}
do
    path=${dropbox_paths[idx]}  
    if [ -d "$path" ]
    then
        echo "[√] - \"$path\""
        echo "start cleaning in 3 seconds"
        sleep 3 && found=1 && find_rm "$path"
        break
    else
        echo "[×] - \"$path\""
    fi
done

if [ -z "$found" ]
then
    echo "* Can not locate Dropbox directory *"
    echo "* function failed *"
fi
