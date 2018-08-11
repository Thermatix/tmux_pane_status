#!/usr/bin/env bash

# function build_status {
# # expects PANE_sTATUS_DISPLAYS to be defined
#   pane_path=$1
#   output=""
#   delimit=${PANE_STATUS_DELIMIT:-" "}
#   for display in $PANE_STATUS_DISPLAYS; do
#     output+="$(displays_dir/$display.zsh $pane_path $pane_id)$delimit"
#   done
#   output
# }
#
#
#
# function show_displays {
#   pane_path=$1
#   pane_id=$2
#
#   # if [ get_tmux_opt "pane_status" "$2" = "1" ]; then
#     pushd pane_path
#     echo "$(build_status $pane_path)"
#     popd
#   # fi
# }
#

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
		all_interpolated="${all_interpolated/#\{${cmd}\}/${commands[$cmd]}}"
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
