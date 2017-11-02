#!/usr/bin/env bash

_pick_a_window() {
fzf-tmux -d30% \
  --with-nth=2..
}

target=$(tmux list-windows -a -F '#{window_id}	#S:#W' | _pick_a_window | cut -f1)
[[ -z $target ]] && return

tmux switch-client -t "$target" &>/dev/null
