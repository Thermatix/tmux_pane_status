
if  [ -n "$TMUX" ];  then
  function set_tmux_opt {
    tmux set -q "@$1_$TMUX_PANE" "$2"
  }

  function get_tmux_opt {
    tmux
  }

  function get_tmux_opt {
      tmux show -v "@$1_$2"
  }

  function turn_on_pane_status {
    set_tmux_opt 'pane_status' '1'
  }

  function turn_off_pane_status {
    set_tmux_opt 'pane_status' '0'
  }

fi

