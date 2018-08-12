#!/usr/bin/env bash

function turn_on_pane_status {
  set_tmux_opt 'pane_status' '1'
}

function turn_off_pane_status {
  set_tmux_opt 'pane_status' '0'
}



function do_interpolation {
  local all_interpolated="$1"
  declare -n di_cmds=$2
  for cmd in "${!di_cmds[@]}"; do
    # echo "$cmd"
    # echo "${di_cmds[$cmd]}"
    # echo "${all_interpolated/\"${cmd}\"/\"${di_cmds[$cmd]}}\""
		all_interpolated="${all_interpolated//${cmd}/${di_cmds[$cmd]}}"
    # echo "$all_interpolated"
  done
	echo "$all_interpolated"
}

function update_tmux_option {
	local option=$1
  declare -n uto_cmds=$2
	local format_value=$(get_tmux_w_option "$option")
  echo "before interpolation $option: $format_value"
  new_format=$(do_interpolation "$format_value" uto_cmds)
  set_tmux_w_option "$option" "$new_format"
  echo "after interpolation $option: $new_format"
}

function main {
  declare -n main_cmds=$1
	update_tmux_option "pane-border-format" main_cmds
}
