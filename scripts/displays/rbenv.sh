#!/usr/bin/env bash

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../lib/helpers.sh"

pane_path=$1
pane_id=$2



if [ "$(display_status_for "$pane_id")" = "1" ]; then
  pushd "$pane_path"
    echo "$(rbenv version-name)"
  popd
fi
