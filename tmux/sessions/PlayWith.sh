#!/usr/bin/env bash

CLIENT_WIDTH=213
CLIENT_HEIGHT=57

session_name='PlayWith'
if tmux has-session -t $session_name &>/dev/null; then
  echo "session [$session_name] already exisits, kill it!"
  tmux kill-session -t "$session_name"
fi

play_with_root="/tmp/PlayWith/"

#
# Python3
#

root="${play_with_root}/Python3" && mkdir -p "$root" &>/dev/null
window_name='Python3'
window="$session_name:$window_name"
tmux new-session     \
  -s "$session_name" \
  -n "$window_name"  \
  -x "$CLIENT_WIDTH"   \
  -y "$CLIENT_HEIGHT"  \
  -d
tmux send-keys -t "$window" "
cd $root
ipython3
"

#
# Bash
#

root="${play_with_root}/Bash" && mkdir -p "$root" &>/dev/null
window_name='Bash'
window="$session_name:$window_name"
tmux new-window -a -d      \
  -t "$session_name:{end}" \
  -n "$window_name"
tmux send-keys -t "$window" "
cd $root
[[ -f t.sh ]] || echo '#!/usr/bin/env bash' > t.sh
vv t.sh
"

#
# Ruby
#

root="${play_with_root}/Ruby" && mkdir -p "$root" &>/dev/null
window_name='Ruby'
window="$session_name:$window_name"
tmux new-window -a -d      \
  -t "$session_name:{end}" \
  -n "$window_name"
tmux send-keys -t "$window" "
cd $root
pry
"
