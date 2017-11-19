#!/usr/bin/env bash
# vim: fdm=marker

CLIENT_WIDTH=213
CLIENT_HEIGHT=57

session_name='Dashboard'
if tmux has-session -t ${session_name} &>/dev/null; then
  echo "session [${session_name}] already exisits, kill it!"
  tmux kill-session -t "${session_name}"
fi


#
# Tasks
#

window_name='Tasks'
window="${session_name}:${window_name}"
tmux new-session     \
  -s "${session_name}" \
  -n "${window_name}"  \
  -x "$CLIENT_WIDTH"   \
  -y "$CLIENT_HEIGHT"  \
  -d
tmux send-keys -t "${window}" 'htop' c-m

#
# Network
#

window_name='Network'
window="${session_name}:${window_name}"
tmux new-window -a -d      \
  -t "${session_name}:{end}" \
  -n "${window_name}"
tmux split-window -t "${window}.1" -h -l 60
tmux split-window -t "${window}.2" -v -l 28

# .1 run iftop
tmux send-keys -t "${window}.1" 'sudo iftop' c-m
tmux send-keys -t "${window}.1" 'ximeng' c-m

# .2 show clock and disable user input
tmux clock-mode -t "${window}.2"
tmux select-pane -t "${window}.2" -d

# .3 run monitor script and disable user input
tmux send-keys -t "${window}.3" "
cd "${HOME}/Develop/Python/vps-info"
bash monitor.sh
"
tmux select-pane -t "${window}.3" -d

tmux select-pane -t "${window}.1"

