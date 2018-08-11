#!/usr/bin/env bash

function turn_on_pane_status {
  set_tmux_opt 'pane_status' '1'
}

function turn_off_pane_status {
  set_tmux_opt 'pane_status' '0'
}



function do_interpolation {
	local all_interpolated="$1"
  local commands="$2"
  for cmd in "$[!commands[@]]"; do
		all_interpolated="${all_interpolated/${cmd}/${commands[$cmd]}}"
  done
	echo "$all_interpolated"
}

function update_tmux_option {
	local option=$1
  local commands=$2
	local option_value=$(get_tmux_option "$option")
	local new_option_value=$(do_interpolation "$option_value" "$commands")
	set_tmux_option "$option" "$new_option_value"
}

function main {
  local commands=$1
	update_tmux_option "pane-border-format" "$commands"
}
