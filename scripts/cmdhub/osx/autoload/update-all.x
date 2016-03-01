#!/usr/bin/env bash
#cmdhub: Update Neovim Plugins, Antigen & Homebrew in Tmux session 'update-all'

s=update-all

tmux has-session -t "$s" &>/dev/null
(( $? == 0 )) && tmux kill-sessio -t "$s"

# window 1
tmux new-session -s "$s" -n 'vim-plugins' -d zsh
tmux send-keys -t "$s":1 'v all' C-m

# window 2
tmux new-window -t "$s" -n 'antigen & homebrew' zsh
tmux split-window -t "$s":2 -h zsh
tmux send-keys -t "$s":2.1 'antigen selfupate && antigen update' C-m
tmux send-keys -t "$s":2.2 'bubu' C-m

# window 3
tmux new-window -t "$s" -n 'pip & gem' zsh
tmux split-window -t "$s":3 -h zsh
tmux send-keys -t "$s":3.1 'echo -------- pip2 -------- && echo && pip2 list -o && echo && echo && -------- pip3 -------- && echo && pip3 list -o' C-m
tmux send-keys -t "$s":3.2 'gem update' C-m
