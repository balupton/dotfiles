#!/usr/bin/env bash

if is-mac; then
	export USER_SHELLS=(
		fish
		bash
		zsh
		sh
	)
else
	export USER_SHELLS=(
		bash
		zsh
		fish
		sh
	)
fi
