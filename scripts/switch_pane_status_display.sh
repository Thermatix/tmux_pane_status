#!/usr/bin/env bash


source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/lib/helpers.sh"

echo "$(get_current_status_for_pane)"

if  display_status_for_pane ; then
  turn_off_pane_status
  display_message "turned display off for pane $(current_pane_id)"
else
  turn_on_pane_status
  display_message "turned display on for pane $(current_pane_id)"
fi
