#!/usr/bin/env zsh

PLUGIN_ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PLUGIN_LIB_DIR="$PLUGIN_ROOT_DIR/lib"
PLUGIN_DISPLAYS_DIR="$PLUGIN_LIB_DIR/displays"

source "$PLUGIN_LIB_DIR/functions.zsh" "$PLUGIN_DISPLAYS_DIR"
source "$PLUGIN_LIB_DIR/commands.zsh"




