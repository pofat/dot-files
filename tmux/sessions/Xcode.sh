#!/usr/bin/env bash

FULL_WIDTH=213
FULL_HEIGHT=57

session_name='Xcode'
if tmux has-session -t $session_name &>/dev/null; then
  echo "session [$session_name] already exisits, kill it!"
  tmux kill-session -t "$session_name"
fi

#
# Log
#

root="/tmp"
window_name='Log'
window="$session_name:$window_name"
tmux new-session     \
  -s "$session_name" \
  -n "$window_name"  \
  -x "$FULL_WIDTH"   \
  -y "$FULL_HEIGHT"  \
  -d
tmux send-keys -t "$window" "
  cd $root
  && mkdir /tmp/mudox/log/Xcode/Jack/
  clear
  "

#
# Framework Projects
#

for window_name in Jack MudoxKit SocialShare; do
  root="~/Develop/Apple/Frameworks/$window_name"
  window="$session_name:$window_name"
  tmux new-window -a -d              \
    -t "$session_name:{end}"         \
    -n "$window_name"
  tmux send-keys -t "$window" "
    cd $root
    vv ${window_name}.podspec
    "
done
