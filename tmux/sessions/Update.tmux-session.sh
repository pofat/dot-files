#!/usr/bin/env bash
# vim: fdm=marker

CLIENT_WIDTH=213
CLIENT_HEIGHT=57

session_name='Update'
if tmux has-session -t ${session_name} &>/dev/null; then
  echo "session [${session_name}] already exisits, kill it!"
  tmux kill-session -t "${session_name}"
fi

#
# Neovim
#

root="${HOME}/Git/vim-config"
window_name='Neovim'
window="${session_name}:${window_name}"
tmux new-session       \
  -s "${session_name}" \
  -n "${window_name}"  \
  -x "$CLIENT_WIDTH"   \
  -y "$CLIENT_HEIGHT"  \
  -c "${root}"         \
  -d
sleep 1
tmux send-keys -t "${window}" "
v all
"

#
# Homebrew
#

root="${HOME}"
window_name='Homebrew'
window="${session_name}:${window_name}"
tmux new-window -a -d        \
  -t "${session_name}:{end}" \
  -n "${window_name}"        \
  -c "${root}"
sleep 1
tmux send-keys -t "${window}" "
bubu
"

#
# Python
#

root="${HOME}"
window_name='Python'
window="${session_name}:${window_name}"
tmux new-window -a -d        \
  -t "${session_name}:{end}" \
  -n "${window_name}"        \
  -c "${root}"
sleep 1
tmux send-keys -t "${window}.1" "
pip2 list --outdated
"

tmux split-window -t "${window}" -h
tmux send-keys -t "${window}.2" "
pip3 list --outdated
"

#
# Ruby
#

root="${HOME}"
window_name='Ruby'
window="${session_name}:${window_name}"
tmux new-window -a -d        \
  -t "${session_name}:{end}" \
  -n "${window_name}"        \
  -c "${root}"
sleep 1
tmux send-keys -t "${window}" "
gem outdated
"

tmux select-window -t "${session_name}:1.1"
echo "[${session_name}] started"
tmux list-window -t "${session_name}" -F ' - #W'
