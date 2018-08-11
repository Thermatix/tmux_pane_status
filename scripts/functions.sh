#!/usr/bin/env zsh
displays_dir=$1
function set_tmux_opt {
  tmux set -q "@$1_$TMUX_PANE" "$2"
}

function get_tmux_opt {
    tmux show -v "@$1_$2"
}


function build_status () {
# expects PANE_sTATUS_DISPLAYS to be defined
  pane_path=$1
  output=""
  delimit=${PANE_STATUS_DELIMIT:-" "}
  for display in $PANE_STATUS_DISPLAYS; do
    output+="$(displays_dir/$display.zsh $pane_path $pane_id)$delimit"
  done
  output
}



function show_displays() {
  pane_path=$1
  pane_id=$2

  # if [ get_tmux_opt "pane_status" "$2" = "1" ]; then
    pushd pane_path
    echo "$(build_status $pane_path)"
    # popd
  fi
}
