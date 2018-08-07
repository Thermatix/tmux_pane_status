#!/usr/bin/env zsh

function turn_on_pane_status {
  set_tmux_opt 'pane_status' '1'
}

function turn_off_pane_status {
  set_tmux_opt 'pane_status' '0'
}
