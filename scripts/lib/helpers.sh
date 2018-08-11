#!/usr/bin/env bash

function set_tmux_option {
	local option=$1
	local value=$2
	tmux set-option -gq "$option" "$value"
}

function get_tmux_option {
	local option="$1"
	local default_value="$2"
	local option_value="$(tmux show-option -gqv "$option")"
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

function set_tmux_pane_opt {
  tmux set -q "@$1_$TMUX_PANE" "$2"
}

function get_tmux_pane_opt {
    tmux show -v "@$1_$2"
}

function cmd {
  local root="$1"
  local cmd="$2"
  echo "[#{\"$cmd\"}]=\"#($root/scripts/displays/$cmd.sh \"#{pane_current_path}\"  \"#{pane_id}\")\"  "
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