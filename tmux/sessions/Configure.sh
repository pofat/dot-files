#!/usr/bin/env bash

FULL_WIDTH=213
FULL_HEIGHT=57

session_name='Configure'
if tmux has-session -t $session_name &>/dev/null; then
  echo "session [$session_name] already exisits, kill it!"
  tmux kill-session -t "$session_name"
fi


#
# Inbox
#

root="~"
window_name='Inbox'
window="$session_name:$window_name"
tmux new-session     \
  -s "$session_name" \
  -n "$window_name"  \
  -x "$full_width"   \
  -y "$full_height"  \
  -d
tmux send-keys -t "$window" "cd $root" c-m

#
# Neovim
#

root="~/Git/vim-config"
window_name='Neovim'
window="$session_name:$window_name"
tmux new-window -a -d      \
  -t "$session_name:{end}" \
  -n "$window_name"
tmux send-keys -t "$window" "
cd $root
vv vimrc
"

#
# Hammerspoon
#

root="~/Git/dot-files/hammerspoon"
window_name='Hammerspoon'
window="$session_name:$window_name"
tmux new-window -a -d              \
  -t "$session_name:{end}"         \
  -n "$window_name"
tmux send-keys -t "$window" "
cd $root
vv init.lua
"

#
# Tmux
#

root="~/Git/dot-files/tmux"
window_name='Tmux'
window="$session_name:$window_name"
tmux new-window -a -d              \
  -t "$session_name:{end}"         \
  -n "$window_name"
tmux send-keys -t "$window" "
cd $root
vv tmux.conf
"

#
# Tmux Session Script
#

root="~/Git/dot-files/tmux/sessions"
window_name='Tmux Sessions'
window="$session_name:$window_name"
tmux new-window -a -d              \
  -t "$session_name:{end}"         \
  -n "$window_name"
tmux send-keys -t "$window" "
cd $root
vv -c 'source .vimrc.local' *.sh
"
tmux split-window -t "$window" -h -p 30

tmux select-window -t "$session_name:Inbox"
