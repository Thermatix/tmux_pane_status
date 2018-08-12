#!/usr/bin/env bash
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../lib/helpers.sh"

if display_status_for_pane; then
  if [ -f "$(pane_current_path)/Cargo.toml" ]; then
    cd "$(pane_current_path)"
    output="rust: $(rustc --version | cut -d ' ' -f2)"
    cd -
    echo "$output"
  fi
fi
