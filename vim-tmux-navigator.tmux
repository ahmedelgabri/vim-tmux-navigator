#!/usr/bin/env bash

is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

is_fzf="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?fzf$'"

bind -n C-h run "($is_vim && tmux send-keys C-h) || tmux select-pane -L"

bind -n C-j run "($is_vim && tmux send-keys C-j)  || ($is_fzf && tmux send-keys C-j) || tmux select-pane -D"

bind -n C-k run "($is_vim && tmux send-keys C-k) || ($is_fzf && tmux send-keys C-k)  || tmux select-pane -U"

bind -n C-l run "($is_vim && tmux send-keys C-l) || tmux select-pane -R"

bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
