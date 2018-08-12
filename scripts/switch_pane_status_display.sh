#!/usr/bin/env bash


source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/lib/helpers.sh"


if [ "$(display_status_for )" = "1" ]; then
  turn_off_pane_status
  # echo "turned display off for pane $(pane_id)"
  echo "turned display off"
else
  turn_on_pane_status
  echo "turned display on"
  # echo "turned display off for pane $(pane_id)"
fi
