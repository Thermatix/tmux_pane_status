#!/usr/local/bin/zsh -f
pane_path=$1
pane_id=$2
pushd "$pane_path"
  #code goes here...
  githud zsh
popd
