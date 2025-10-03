#!/usr/bin/env bash
# shellcheck disable=SC2034
# Used by `interactive.sh`
# Do whatever you want in this file

# load defaults
source "$DOROTHY/config/interactive.bash"

# load .sh for bash, remember, fish doesn't load this file, jusut interactive.sh as interactive.fish doesn't exist
source "$DOROTHY/user/config/interactive.sh"

# Update Apple Shortcuts Screen Time usage of VSCode in the background'
(
	set +b # disable background notifications
	screentime-work --quiet --update &
)
