#!/usr/bin/env bash
set -euo pipefail

source ~/Git/dot-files/bash/lib/jack

usage='$0 repo-name'

if [[ ! $# -eq 1 ]]; then
  jackError "$usage"
  exit 1
fi

jackInfo 'Creating git repo'
git init
git add --all
git commit -m 'Initial commit'

jackInfo "Creating github.com/mudox/$1"
hub create "$1"

jackInfo 'Adding .gitignore'
types=$(git ignore list | tr ',' '\n' | fzf -m)
for type in ${types}; do
  git ignore "${type}" >> .gitignore
done

jackInfo 'Performing the initial `git push`'
git push --set-upstream origin master

hub browse
