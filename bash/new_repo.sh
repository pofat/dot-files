#!/usr/bin/env bash
set -euo pipefail

source ~/Git/dot-files/bash/lib/jack

usage='$0 repo-name'

if [[ ! $# -eq 1 ]]; then
  jackError "$usage"
  exit 1
fi

jackInfo '\nCreating git repo'
sleep 1

git init
git add --all
git commit -m 'Initial commit'

jackInfo "\nCreating github.com/mudox/$1"
sleep 1

hub create "$1"

jackInfo '\nCreating .gitignore'
sleep 1

types=$(git ignore list | tr ',' '\n' | fzf -m)
for type in ${types}; do
  git ignore "${type}" >> .gitignore
done

jackInfo '\nPerforming initial push'
sleep 1

git push --set-upstream origin master

jackInfo "\nDone, bringing you to github.com/mudox/$1"
sleep 1

hub browse
