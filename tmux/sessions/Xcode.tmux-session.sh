#!/usr/bin/env bash
# vim: fdm=marker

CLIENT_WIDTH=213
CLIENT_HEIGHT=57

session_name='Xcode'
if tmux has-session -t ${session_name} &>/dev/null; then
  echo "session [${session_name}] already exisits, kill it!"
  tmux kill-session -t "${session_name}"
fi

#
# Log
#

root="/tmp"
window_name='Log'
window="${session_name}:${window_name}"

mkdir /tmp/mudox/log/Xcode/Jack/ &>/dev/null

tmux new-session      \
  -s "${session_name}"  \
  -n "${window_name}"   \
  -x "$CLIENT_WIDTH"  \
  -y "$CLIENT_HEIGHT" \
  -c "${root}"        \
  -d

#
# Framework Projects
#

for window_name in Jack iOSKit SocialKit RandomUser; do
  root="${HOME}/Develop/Apple/Frameworks/${window_name}"
  window="${session_name}:${window_name}"
  tmux new-window -a -d              \
    -t "${session_name}:{end}"         \
    -n "${window_name}"		     \
    -c "${root}"
  sleep 0.5
  tmux send-keys -t "${window}" "
  vv -O ${window_name}.podspec Example/Podfile
  "
done
