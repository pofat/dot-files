#!/usr/bin/env bash
#cmdhub: Delete conflicting files in my cloud directory

cloud_path='/Volumes/Apple_Store/Cloud'
gfind "$cloud_path" -iname '*NSConflict*' -print -delete
gfind "$cloud_path" -iname '*conflicted copy*' -print -delete
gfind "$cloud_path" -iname '*-冲突-*' -print -delete
