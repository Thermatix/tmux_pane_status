#!/usr/bin/env bash

function cwd {
  echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
}

plugin_root_dir="$(cwd)"
source "$plugin_root_dir/scripts/lib/functions.sh"
source "$plugin_root_dir/scripts/lib/helpers.sh"

declare -A cmds

list_commands plugin_root_dir cmds rbenv githud

# for k in "${!cmds[@]}"; do
#   echo "$k:${cmds[$k]}"
# done

main cmds

