#!/usr/bin/env bash

# dorothy configuration options:
# https://github.com/bevry/dorothy#configuration
# https://github.com/bevry/dorothy/blob/master/sources/defaults.sh

# inherit the cross-platform shell configuration
source "$DOROTHY/user/source.sh"

# prepare
hostname="$("$DOROTHY/commands/get-hostname")"

# redcheetah kill everything
if test -f "$DOROTHY/user/env/$hostname.bash"; then
	source "$DOROTHY/user/env/$hostname.bash"
elif test -f "$DOROTHY/user/sources/$hostname.bash"; then
	source "$DOROTHY/user/sources/$hostname.bash"
elif test -f "$DOROTHY/user/env/generic.bash"; then
	source "$DOROTHY/user/env/generic.bash"
elif test -f "$DOROTHY/user/sources/generic.bash"; then
	source "$DOROTHY/user/sources/generic.bash"
fi
