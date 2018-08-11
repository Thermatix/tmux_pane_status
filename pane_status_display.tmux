#!/usr/bin/env zsh

function cwd {
  "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
}

PLUGIN_ROOT_DIR=cwd
PLUGIN_LIB_DIR="$PLUGIN_ROOT_DIR/lib"
PLUGIN_DISPLAYS_DIR="$PLUGIN_LIB_DIR/displays"

source "$PLUGIN_LIB_DIR/functions.zsh" "$PLUGIN_DISPLAYS_DIR"
source "$PLUGIN_LIB_DIR/commands.zsh"


pane_path=$1
pane_id=$2

# show_displays $pane_path $display
