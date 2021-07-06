#!/usr/bin/env sh
# this file must be compatible with fish, zsh, bash

# dorothy configuration options:
# https://github.com/bevry/dorothy#configuration
# https://github.com/bevry/dorothy/blob/master/sources/defaults.sh

# dorothy ecosystem
export GIT_PROTOCOL='ssh'
export GIT_DEFAULT_BRANCH='main'
export DOROTHY_THEME='oz' # 'starship'

# other
# export HOMEBREW_ARCH='arm64e'
export SHELLCHECK_OPTS='-e SC2096 -e SC1090 -e SC1091 -e SC1071'
alias go-open='open -a /Applications/GoLand.app .'

# source my env file
. "$DOROTHY/user/env.sh"
