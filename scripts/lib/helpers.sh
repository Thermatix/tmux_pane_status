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

function current_pane_id {
  echo "$(tmux display -p '#{pane_id}')"
}

function contextual_pane_id {
  echo "$PANE_ID"
}

function pane_current_path {
  echo "$(tmux display -p '#{pane_current_path}')"
}

function set_tmux_pane_opt {
  option_name="$1"
  value=$2
  tmux set -q "@$option_name_$(current_pane_id)" "$value"
}

function get_tmux_pane_opt {
  option_name="$1"
  tmux show -vq "@$option_name_$(current_pane_id)"
}

function get_contextual_tmux_pane_opt {
  option_name="$1"
  tmux show -vq "@$option_name_$(contextual_pane_id)"
}

function display_status_for_pane  {
  [ "$(get_tmux_pane_opt 'pane_status')" = "1" ]
}

function check_file {
  file="$1"
  [ -f "$(pane_current_path)/$file" ]
}

function check_dir {
  dir="$1"
  [ -d "$(pane_current_path)/$dir" ]
}

function turn_on_pane_status {
  set_tmux_pane_opt 'pane_status' '1'
}

function turn_off_pane_status {
  set_tmux_pane_opt 'pane_status' '0'
}

function display_message {
  message="$1"
  tmux display-message -p -t"$(current_pane_id)" "$message"
}

function set_pane_path {
  $current_pane_path=$1
  set_tmux_pane_opt 'pane_path' "$current_pane_path"
}

function execute {
  cmd="$@"
  echo "$(cd $(pane_current_path) && ${cmd[@]})"
}

function list_commands {
  declare -n root="$1"
  declare -n c="$2"
  local command_list="${*:3}"
  for cmd in $command_list; do
    c["#{$cmd}"]="#($root/scripts/displays/$cmd.sh)"
  done
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
