#!/usr/bin/env bash

function cwd {
  echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
}

PLUGIN_ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$PLUGIN_ROOT_DIR/scripts/lib/functions.sh"
source "$PLUGIN_ROOT_DIR/scripts/lib/helpers.sh"

commands=(
["rbenv_ruby_ver"]="#($PLUGIN_ROOT_DIR/scripts/displays/rbenv_ruby_ver.sh)"
  # [""]="$PLUGIN_ROOT_DIR/scripts/displays/"
)

# show_displays $pane_path $display
