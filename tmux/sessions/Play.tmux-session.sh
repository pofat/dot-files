#!/usr/bin/env bash

CLIENT_WIDTH=213
CLIENT_HEIGHT=57

session_name='Play'
if tmux has-session -t $session_name &>/dev/null; then
  echo "session [$session_name] already exisits, kill it!"
  tmux kill-session -t "$session_name"
fi

session_root="$HOME/Develop"

#
# Shell
#

root="${session_root}/Shell/Play"
window_name='Shell'
window="$session_name:$window_name"
tmux new-session      \
  -s "$session_name"  \
  -n "$window_name"   \
  -x "$CLIENT_WIDTH"  \
  -y "$CLIENT_HEIGHT" \
  -c "$root"          \
  -d
sleep 0.5
tmux send-keys -t "$window" "
vv -c 'source ./.vimrc.local' inbox.sh
"
tmux split-window -t "$window" -h bash

#
# Python3
#

root="${session_root}/python3" && mkdir -p "$root" &>/dev/null
window_name='Python3'
window="$session_name:$window_name"
tmux new-window -a -d      \
  -t "$session_name:{end}" \
  -n "$window_name"        \
  -c "$root"
sleep 0.5
tmux send-keys -t "$window" "
ipython3
"


#
# Ruby
#

root="${session_root}/ruby" && mkdir -p "$root" &>/dev/null
window_name='Ruby'
window="$session_name:$window_name"
tmux new-window -a -d      \
  -t "$session_name:{end}" \
  -n "$window_name"        \
  -c "$root"
sleep 0.5
tmux send-keys -t "$window" "
pry
"
