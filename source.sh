#!/usr/bin/env sh

# dorothy configuration options:
# https://github.com/bevry/dorothy#configuration
# https://github.com/bevry/dorothy/blob/master/sources/defaults.sh

# dorothy ecosystem
export GIT_PROTOCOL="ssh"
export GIT_DEFAULT_BRANCH="main"

# other
export SHELLCHECK_OPTS="-e SC2096 -e SC1090 -e SC1091 -e SC1071"
alias go-open="open -a /Applications/GoLand.app ."

# load my env file if it exists (it may be missing if it hasn't been copied over, as clones do not keep it)
if test -f "$DOROTHY/user/env.sh"; then
	. "$DOROTHY/user/env.sh"
fi
