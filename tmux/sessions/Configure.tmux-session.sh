#!/usr/bin/env bash
# vim: fdm=marker

CLIENT_WIDTH=213
CLIENT_HEIGHT=57

session_name='Configure'
if tmux has-session -t ${session_name} &>/dev/null; then
  echo "session [${session_name}] already exisits, kill it!"
  tmux kill-session -t "${session_name}"
fi


#
# Inbox
#

root="${HOME}/Git/dot-files"
window_name='Inbox'
window="${session_name}:${window_name}"
tmux new-session       \
  -s "${session_name}" \
  -n "${window_name}"  \
  -x "$CLIENT_WIDTH"   \
  -y "$CLIENT_HEIGHT"  \
  -c "${root}"         \
  -d

#
# Neovim
#

root="${HOME}/Git/vim-config"
window_name='Neovim'
window="${session_name}:${window_name}"
tmux new-window              \
  -a                         \
  -t "${session_name}:{end}" \
  -n "${window_name}"        \
  -c "${root}"               \
  -d
sleep 1
tmux send-keys -t "${window}" "
vv vimrc
"

#
# Hammerspoon
#

root="${HOME}/Git/dot-files/hammerspoon"
window_name='Hammerspoon'
window="${session_name}:${window_name}"
tmux new-window              \
  -a                         \
  -t "${session_name}:{end}" \
  -n "${window_name}"        \
  -c "${root}"               \
  -d
tmux send-keys -t "${window}" "
vv init.lua
"

#
# Tmux
#

root="${HOME}/Git/dot-files/tmux"
window_name='Tmux'
window="${session_name}:${window_name}"
tmux new-window              \
  -a                         \
  -t "${session_name}:{end}" \
  -n "${window_name}"        \
  -c "${root}"               \
  -d
tmux send-keys -t "${window}" "
vv tmux.conf
"

#
# Tmux Session Script
#

root="${HOME}/Git/dot-files/tmux/sessions"
window_name='Tmux Sessions'
window="${session_name}:${window_name}"
tmux new-window              \
  -a                         \
  -t "${session_name}:{end}" \
  -n "${window_name}"        \
  -c "${root}"               \
  -d
tmux send-keys -t "${window}" "
vv -c 'source .vimrc.local' *.sh
"

tmux split-window  \
  -t "${window}.1" \
  -h               \
  -p 30            \
  -c "${root}"

tmux select-window -t "${session_name}:1.1"
echo "[${session_name}] started"
tmux list-window -t "${session_name}" -F ' - #W'
