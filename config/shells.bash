#!/usr/bin/env bash
# shellcheck disable=SC2034
# do not use `export` keyword in this file

if is-mac; then
	USER_SHELLS=(
		fish
		bash
		zsh
		sh
	)
else
	USER_SHELLS=(
		bash
		zsh
		fish
		sh
	)
fi
