#!/usr/local/bin/zsh -f
dir="$1"
pane_id="$2"

if [ "$(tmux show -v @pane_status_$pane_id)" = "1" ]; then
	cd "$dir" && githud zsh
fi
