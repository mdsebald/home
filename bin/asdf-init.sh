#!/usr/bin/env bash
# vim:ft=bash:et:sw=4:
# shellcheck disable=SC1090,SC1091,SC2155 shell=bash

set -o errexit
set -o nounset

source "$HOME/.asdf/asdf.sh"

asdf plugin add erlang
asdf plugin add elixir
asdf plugin add nodejs
asdf plugin add yarn
