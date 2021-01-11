#!/usr/bin/env bash

# dorothy configuration options:
# https://github.com/bevry/dorothy#configuration
# https://github.com/bevry/dorothy/blob/master/sources/defaults.sh

# inherit the cross-platform shell configuration
source "$DOROTHY/user/source.sh"

# dns
if "$DOROTHY/commands/is-mac"; then
	export DNS_NOFAP="yes"
	export DNS_SERVICE="system"
	export DNS_PROVIDER="env"
	export DNS_IPV4SERVERS=(
		"192.168.5.20"
	)
	export DNS_IPV6SERVERS=(
		"fd4a:1de5:c962:1:dea6:32ff:fec1:a6fc"
	)
fi

export USER_SHELLS=(
	fish
	bash
	zsh
	sh
)

export APK_INSTALL=(
	aria2
	bash
	fish
	git
	gnupg
	python
	ruby
	tree
	wget
)

export APT_REMOVE=(
	aisleriot
	gnome-mahjongg
	gnome-mines
	gnome-sudoku
	gnomine
	imagemagick
	"libreoffice*"
	rhythmbox
	shotwell
	thunderbird
)

export APT_ADD=(
	# ruby-dev
	# software-properties-common
	build-essential
	curl
	fish
	git
	libssl-dev
	make
	openssl
	python
	ruby
	vim
)

export SNAP_INSTALL=(
	code
	deno
	go --classic
)

# https://github.com/Microsoft/vscode-go/wiki/Go-tools-that-the-Go-extension-depends-on
# https://github.com/golang/go/wiki/gopls#editors-instructions
if "$DOROTHY/commands/is-mac"; then
	export GO_INSTALL=(
		changkun.de/x/rmtrash
		github.com/cloudflare/utahfs/cmd/utahfs-client
	)
else
	export GO_INSTALL=(
		changkun.de/x/rmtrash
	)
fi

export HOMEBREW_ARCH="x86_64"
export HOMEBREW_INSTALL=(
	# azure-cli
	# balena-cli
	# blackbox
	# heroku
	# yarn
	aria2
	bash
	bash-completion
	coreutils
	deno
	fish
	gh
	git
	git-extras
	git-lfs
	go
	hashicorp/tap/boundary
	hashicorp/tap/consul
	hashicorp/tap/nomad
	hashicorp/tap/terraform
	hashicorp/tap/vault
	hub
	jq
	kryptco/tap/kr
	mas
	micro
	openssh
	pkg-config
	podman
	python
	ruby
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
export PYTHON_INSTALL=(
	# bitcoinlib
	# cairosvg
	httpie
	PyPDF2
)

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
	# typescript@next
	eslint
	json
	prettier
	tldr
	typescript

	# cryptocurrency
	# cartera
	# coinmon
)
