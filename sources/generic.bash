#!/usr/bin/env bash

# note on youtube-dl
# brew maintains it actively, and also will assist with dependencies
# however, ubuntu is slow to maintain, so install via pip instead
# http://ytdl-org.github.io/youtube-dl/download.html

if "$DOROTHY/commands/is-mac"; then
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

export APK_INSTALL=(
	# gocryptfs: use `setup-gocryptfs` instead, as this version lags behind
	aria2
	git
	gnupg
	tree
	wget
)

# export APT_REMOVE=(
# 	aisleriot
# 	gnome-mahjongg
# 	gnome-mines
# 	gnome-sudoku
# 	gnomine
# 	imagemagick
# 	"libreoffice*"
# 	rhythmbox
# 	shotwell
# 	thunderbird
# )

export APT_ADD=(
	# software-properties-common
	aria2
	atomicparsley # a youtube-dl dependency
	build-essential
	curl
	git
	gnome-keyring
	libnotify-bin
	libssl-dev
	make
	openssl
	traceroute
	vim
)

# https://code.visualstudio.com/docs/setup/linux
# if [[ "$(get-arch)" == 'x'* ]]; then
export SNAP_INSTALL=(
	# 'code --classic'
	# deno
)

if "$DOROTHY/commands/is-mac"; then
	export GO_INSTALL=(
		changkun.de/x/rmtrash
		github.com/cloudflare/utahfs/cmd/utahfs-client
	)
else
	export GO_INSTALL=(
		changkun.de/x/rmtrash
		# github.com/rfjakob/gocryptfs: use `setup-gocryptfs` instead, as this version lags behind
	)
fi

export HOMEBREW_ARCH="x86_64"
export HOMEBREW_INSTALL=(
	# azure-cli
	# balena-cli
	# blackbox
	# heroku
	# kryptco/tap/kr
	# yarn
	aria2
	coreutils
	deno
	git
	git-extras
	git-lfs
	hashicorp/tap/boundary
	hashicorp/tap/consul
	hashicorp/tap/nomad
	hashicorp/tap/terraform
	hashicorp/tap/vault
	ImageMagick
	mas
	micro
	openssh
	pkg-config
	podman
	screen
	terminal-notifier
	tmux
	tree
	vim
	watch
	watchman
	wget
)
export HOMEBREW_INSTALL_SLOW=(
	gpg
	shellcheck
)
export HOMEBREW_INSTALL_CASK=(
	# 1password-cli
	# acorn
	# adguard
	# airparrot
	# appzapper
	# atom
	# audio-hijack
	# backblaze
	# bartender
	# brave
	# burn
	# caption
	# ccleaner
	# contexts
	# dat
	# devdocs
	# fantastical
	# firefox
	# freedom
	# geekbench
	# github-desktop
	# gitter
	# google-chrome
	# google-hangouts
	# jaikoz
	# julia
	# keybase
	# kodi
	# little-snitch
	# loopback
	# micro-snitch
	# numi
	# opera
	# paragon-ntfs
	# plex-media-server
	# pomello
	# reflector
	# screenflow
	# signal
	# sketch
	# skype
	# soundsource
	# spotify
	# teamviewer
	# toggldesktop
	# torbrowser
	# tower
	# transmission
	# transmit
	# tunnelbear
	# tunnelblick
	# ubersicht
	# undercover
	# usage
	# visual-studio-code
	# vlc
	# vmware-fusion
	# webtorrent
	# windscribe
	# workflowy
	# xld
	calibre
)

# gems
export RUBY_VERSION="2.7"
export RUBY_INSTALL=(
	compass
	ffi
	git-up
	sass
	twurl
)

# pip
# @todo swap PyPDF2 fro one of the following
# > https://stackoverflow.com/a/63557138/130638
# - https://github.com/pymupdf/PyMuPDF
# - https://github.com/pikepdf/pikepdf
# - https://github.com/pdfminer/pdfminer.six
export PYTHON_INSTALL=(
	# bitcoinlib
	# cairosvg
	# PyPDF2  # python 2 only
)
if "$DOROTHY/commands/is-ubuntu"; then
	PYTHON_INSTALL+=('youtube_dl')
fi

# npm/yarn
export NODE_INSTALL=(
	# bevry
	"@bevry/testen"
	boundation

	# servers
	# browser-refresh
	# live-server
	serve

	# database
	# fauna-shell

	# ecosystems
	# "@stencil/core"
	# @cloudflare/wrangler
	# apollo
	# ember-cli
	# firebase-tools
	# ionic
	# lasso-cli
	# marko-cli
	# marko-starter
	# netlify-cli
	# now

	# tooling
	# tldr: replaced with tealdeer
	# typescript@next
	eslint
	json
	prettier
	typescript

	# cryptocurrency
	# cartera
	# coinmon
)

# rust/cargo/crates.io
# --locked: Require Cargo.lock is up to date
# as rust packages can be supported by many package managers, and as cargo requires downloading every dependency, most rust packages are better installed via SETUP_UTILS
export RUST_INSTALL=()

# utilities
# setup-util-*
export SETUP_UTILS=(
	bandwich
	bash
	bat
	bottom
	delta
	dust
	exa
	fd
	fish
	gh
	grex
	httpie
	hyperfine
	jq
	procs
	ripgrep
	rmesg
	sd
	tealdeer
	tokei
	zoxide
)
