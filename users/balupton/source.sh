#!/usr/bin/env sh

# DOROTHY ECOSYSTEM
# https://github.com/bevry/dorothy/blob/master/sources/defaults.sh
export GIT_PROTOCOL="ssh"
export GIT_DEFAULT_BRANCH="main"

# OTHER
export SHELLCHECK_OPTS="-e SC2096 -e SC1090 -e SC1091 -e SC1071"
alias go-open="open -a /Applications/GoLand.app ."

# ENV
. "$DOROTHY/user/env.sh"
