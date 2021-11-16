#!/usr/bin/env bash
# shellcheck disable=SC2034
# do not use `export` keyword in this file

# note on youtube-dl
# brew maintains it actively, and also will assist with dependencies
# however, ubuntu is slow to maintain, so install via pip instead
# http://ytdl-org.github.io/youtube-dl/download.html

APK_INSTALL=(
	# gocryptfs: use `setup-util-gocryptfs` instead, as this version lags behind
	gnupg
	tree
	wget
)

# APT_REMOVE=(
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

APT_ADD=(
	# software-properties-common
	atomicparsley # a youtube-dl dependency
	build-essential
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
SNAP_INSTALL=(
	# 'code --classic'
	# deno
)

GO_INSTALL=(
	'github.com/uw-labs/strongbox'
	# 'github.com/rfjakob/gocryptfs' # use `setup-util-gocryptfs` instead, as this version lags behind
)
if is-mac; then
	GO_INSTALL+=(
		'changkun.de/x/rmtrash'
		# 'github.com/cloudflare/utahfs/cmd/utahfs-client'
	)
fi

HOMEBREW_INSTALL=(
	# azure-cli
	# balena-cli
	# blackbox
	# hashicorp/tap/boundary
	# hashicorp/tap/consul
	# hashicorp/tap/nomad
	# hashicorp/tap/terraform
	# hashicorp/tap/vault
	# heroku
	# kryptco/tap/kr
	# yarn
	coreutils
	deno
	git-extras
	git-lfs
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
HOMEBREW_INSTALL_SLOW=(
	gpg
	shellcheck
)
HOMEBREW_INSTALL_CASK=(
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
RUBY_VERSION="2.7"
RUBY_INSTALL=(
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
PIPX_INSTALL=('youtube_dl' 'stig' 'katcr' 'poetry')
# PYTHON3_PIP_INSTALL=('bitcoinlib' 'cairosvg')
# PYTHON2_PIP_INSTALL=('PyPDF2')

# npm/yarn
NODE_INSTALL=(
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
RUST_INSTALL=()

# utilities
# setup-util-*
SETUP_UTILS=(
	aria2
	bandwich
	bash
	bat
	bottom
	curl
	delta
	dust
	exa
	fd
	fish
	gh
	git
	gocryptfs
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
