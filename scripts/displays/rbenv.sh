#!/usr/bin/env bash
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../lib/helpers.sh"

if  display_status_for_pane && check_file 'Gemfile'; then
  echo "ruby $(execute rbenv version-name)"
fi
