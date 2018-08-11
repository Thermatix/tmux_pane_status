#!/usr/bin/env bash
pane_path=$1
pane_id=$2

cd "$pane_path" && rustc --version | cut -d ' ' -f2
