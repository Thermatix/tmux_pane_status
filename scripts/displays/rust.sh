#!/usr/bin/env bash
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../lib/helpers.sh"

if  display_status_for_pane ; then
  if check_file 'Cargo.toml'; then
    echo "$(execute rustc --version)"
  fi
fi



