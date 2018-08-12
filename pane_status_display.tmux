#!/usr/bin/env bash

plugin_root_dir=""$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )""
source "$plugin_root_dir/scripts/lib/functions.sh"
source "$plugin_root_dir/scripts/lib/helpers.sh"

declare -A cmds

list_commands plugin_root_dir cmds rbenv githud rust

# for k in "${!cmds[@]}"; do
#   echo "$k:${cmds[$k]}"
# done

main cmds

tmux bind-key D run-shell "$plugin_root_dir/scripts/switch_pane_status_display.sh"

