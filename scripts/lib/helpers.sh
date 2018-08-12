#!/usr/bin/env bash

function set_tmux_w_option {
	local option=$1
	local value=$2
  echo "$option:$value"
	tmux setw -gq "$option" "$value"
}

function get_tmux_w_option {
	local option="$1"
	local default_value="$2"
	local option_value="$(tmux showw -gv "$option")"
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

function pane_id {
  echo "$(tmux display -p '#{pane_index}')"
}

function set_tmux_pane_opt {
  option_name="$1"
  value=$2
  tmux set -q "@$option_name_$(pane_id)" "$value"
}

function get_tmux_pane_opt {
  option_name="$1"
  tmux show -vq "@$option_name_$(pane_id)"
}

function display_status_for {
  echo "$(get_tmux_pane_opt "$(pane_id)")"
}

function turn_on_pane_status {
  set_tmux_pane_opt 'pane_status' '1'
}

function turn_off_pane_status {
  set_tmux_pane_opt 'pane_status' '0'
}

function list_commands {
  declare -n root="$1"
  declare -n c="$2"
  local command_list="${*:3}"
  for cmd in $command_list; do
    c["#{$cmd}"]="#($root/scripts/displays/$cmd.sh \"#{pane_current_path}\" \"#{pane_id}\")"
  done
}

function cmd {
  local root="$1"
  local cmd="$2"
  local key="[#{\"$cmd\"}]"
  local value=
  echo "$key=\"#($value)\""
}

function is_osx {
	[ $(uname) == "Darwin" ]
}

function is_freebsd {
	[ $(uname) == "FreeBSD" ]
}

function is_openbsd {
	[ $(uname) == "OpenBSD" ]
}

function is_linux {
	[ $(uname) == "Linux" ]
}

function is_cygwin {
	command -v WMIC &> /dev/null
}

function is_linux_iostat {
	# Bug in early versions of linux iostat -V return error code
	iostat -c &> /dev/null
}

# is second float bigger?
function fcomp {
	awk -v n1=$1 -v n2=$2 'BEGIN {if (n1<n2) exit 0; exit 1}'
}

function command_exists {
	local cmd="$1"
	command -v "$cmd" &> /dev/null
}
