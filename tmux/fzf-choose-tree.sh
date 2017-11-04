#!/usr/bin/env bash

_fzf() {
  fzf --with-nth=2.. --tiebreak=index --ansi
}

_target_lines() {
  session_lines=$(tmux list-sessions -F '#{session_id} #S')
  while read session_id session_name; do
    printf '\n%s\n' "$session_id	[38;5;16m $session_name[0m"
    window_lines=$(tmux list-windows -t "${session_id}" -F '#{window_id} #W')
    while read window_id window_name; do
      printf "%s\t - %-40s%20s\n" "$window_id" "[38;5;048m$window_name[0m" "[38;5;242m$session_name[0m"
    done <<< "$window_lines"
  done <<< "$session_lines"
}

target=$(_target_lines | _fzf | cut -f1)
tmux switch-client -t "$target" &>/dev/null
