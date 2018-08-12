#!/usr/bin/env bash
pane_path=$1
pane_id=$2
pushd "$pane_path"
  echo "$(rbenv version-name)"
popd
