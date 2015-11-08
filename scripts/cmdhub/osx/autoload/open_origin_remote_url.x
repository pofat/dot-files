#!/usr/bin/env bash
# cmdhub: Open remote (origin) url of currrent git repo

open $(git remote -v | awk '{print $2}' | head -n1 | sed -e 's/git@github.com:/http:\/\/github.com\//')
