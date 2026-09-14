#!/usr/bin/env bash
# shellcheck disable=SC2034
# Used by `interactive.sh`
# Do whatever you want in this file

# load defaults
source "$DOROTHY/config/interactive.bash"

# load .sh for bash, remember, fish doesn't load this file, jusut interactive.sh as interactive.fish doesn't exist
source "$DOROTHY/user/config/interactive.sh"

# MacOS
if is-system --macos; then
	# Update Apple Shortcuts Screen Time usage of VSCode in the background'
	(
		set +b # disable background notifications
		screentime-work --quiet --update &
	)

	# Remove Elgato Stream Deck logs as they baloon to 100GB within a week
	rm -rf "$HOME/Library/Logs/ElgatoStreamDeck" || true

	# Renive other logs that also baloon
	rm -rf "$HOME/Library/Logs/ESDZoom" || true

	# If my external HDD is mounted, redo the plex symlink

fi

# carapace
# https://carapace-sh.github.io/carapace-bin/setup.html#zsh
if command -v carapace >/dev/null 2>&1; then
	eval "$(carapace _carapace bash)" # if this fails or outputs a warning, you are running in an old bash: https://github.com/carapace-sh/carapace-bin/issues/3685
fi
