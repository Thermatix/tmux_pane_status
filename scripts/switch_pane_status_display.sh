#!/usr/bin/env bash


source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/lib/helpers.sh"


if [ "$(display_status_for)" = "1" ]; then
  turn_off_pane_status
  tmux send-keys "turned display off for pane $TMUX_PANE"
else
  turn_on_pane_status
  tmux send-keys "turned display on for pane $TMUX_PANE"
fi
