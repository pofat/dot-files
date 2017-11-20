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

root="${HOME}/Library/Logs/JacKit"
window_name='Log'
window="${session_name}:${window_name}"
mkdir -p "${root}" &>/dev/null
tmux new-session       \
  -s "${session_name}" \
  -n "${window_name}"  \
  -x "$CLIENT_WIDTH"   \
  -y "$CLIENT_HEIGHT"  \
  -c "${root}"         \
  -d
sleep 1
tmux send-keys -t "${window}" "
jacsrv -p 8383
"

#
# Framework Projects
#

for window_name in JacKit iOSKit SocialKit RandomUser; do
  root="${HOME}/Develop/Apple/Frameworks/${window_name}"
  window="${session_name}:${window_name}"
  tmux new-window -a -d        \
    -t "${session_name}:{end}" \
    -n "${window_name}"        \
    -c "${root}"
  sleep 0.5
  tmux send-keys -t "${window}" "
  vv -O ${window_name}.podspec Example/Podfile
  "
done

tmux select-window -t "${session_name}:1.1"
echo "[${session_name}] started"
tmux list-window -t "${session_name}" -F ' - #W'
