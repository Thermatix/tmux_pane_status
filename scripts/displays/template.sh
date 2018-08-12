#!/usr/bin/env bash

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../lib/helpers.sh"

if display_status_for_pane; then
  cd "$(pane_current_path)"
  #code goes here
  cd -
  echo "$output"
fi

