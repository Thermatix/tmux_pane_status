#!/usr/bin/env bash
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../lib/helpers.sh"

if display_status_for_pane ; then
  if check_file 'Cargo.toml' ; then
    echo "rust $(execute cargo --version | cut -d' ' -f2)"
  fi
fi



