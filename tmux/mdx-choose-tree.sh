#!/usr/bin/env bash

target=$(tmux list-windows -a -F '#{window_id}	#S:#W' | fzf-tmux -d30% --with-nth=2 | cut -f1)
[[ -z $target ]] && return

tmux switch-client -t "$target" &>/dev/null
