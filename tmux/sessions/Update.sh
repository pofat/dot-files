#!/usr/bin/env bash

full_width=213
full_height=57

session_name='Update'
if tmux has-session -t $session_name &>/dev/null; then
  echo "session [$session_name] already exisits, kill it!"
  tmux kill-session -t "$session_name"
fi


#
# Neovim
#

root="~/Git/vim-config"
window_name='Neovim'
window="$session_name:$window_name"
tmux new-session     \
  -s "$session_name" \
  -n "$window_name"  \
  -x "$full_width"   \
  -y "$full_height"  \
  -d
tmux send-keys -t "$window" "
cd $root
v all
"

#
# Homebrew
#

root="~"
window_name='Homebrew'
window="$session_name:$window_name"
tmux new-window -a -d      \
  -t "$session_name:{end}" \
  -n "$window_name"
tmux send-keys -t "$window" "
cd $root
clear
bubu
"

#
# Python
#

root="~"
window_name='Python'
window="$session_name:$window_name"
tmux new-window -a -d              \
  -t "$session_name:{end}"         \
  -n "$window_name"
tmux send-keys -t "$window.1" "
cd $root
clear
pip2 list --outdated
"
tmux split-window -t "$window" -h
tmux send-keys -t "$window.2" "
cd $root
clear
pip3 list --outdated
"

#
# Ruby
#

root="~"
window_name='Ruby'
window="$session_name:$window_name"
tmux new-window -a -d              \
  -t "$session_name:{end}"         \
  -n "$window_name"
tmux send-keys -t "$window" "
cd $root
clear
gem outdated
"
