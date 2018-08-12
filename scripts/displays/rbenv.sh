#!/usr/bin/env bash

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../lib/helpers.sh"

if display_status_for_pane; then
  if [ -f "$(pane_current_path)/Gemfile" ]; then
    cd "$(pane_current_path)"
    output="ruby: $(rbenv version-name)"
    cd -
    echo "$output"
  fi
fi
