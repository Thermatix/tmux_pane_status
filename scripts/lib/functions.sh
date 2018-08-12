#!/usr/bin/env bash



function do_interpolation {
  local all_interpolated="$1"
  declare -n di_cmds=$2
  for cmd in "${!di_cmds[@]}"; do
		all_interpolated="${all_interpolated//${cmd}/${di_cmds[$cmd]}}"
  done
	echo "$all_interpolated"
}

function update_tmux_option {
	local option=$1
  declare -n uto_cmds=$2
	local format_value=$(get_tmux_w_option "$option")
  new_format=$(do_interpolation "$format_value" uto_cmds)
  set_tmux_w_option "$option" "$new_format"
}

function main {
  declare -n main_cmds=$1
	update_tmux_option "pane-border-format" main_cmds
}
