#!/usr/bin/env bash
# shellcheck disable=SC2034
# do not use `export` keyword in this file

# load the dorothy defaults
source "$DOROTHY/config/setup.bash"

# fetch hostname, without .local suffix
hostname="$(get-hostname)"
hostname="${hostname%.local}"

# note on youtube-dl
# brew maintains it actively, and also will assist with dependencies
# however, ubuntu is slow to maintain, so install via pip instead
# http://ytdl-org.github.io/youtube-dl/download.html

APK_INSTALL=()

# APT_UNINSTALL=(
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

# software-properties-common
# 	`atomicparsley` is a youtube-dl dependency
APT_INSTALL=(
	'gnome-keyring'
	'libnotify-bin'
	'traceroute'
)

# Snap
# https://code.visualstudio.com/docs/setup/linux
# if [[ "$(get-arch)" == 'x'* ]]; then
SNAP_INSTALL=()

# Go
GO_LINTING_INSTALL='no'
GO_INSTALL=()
# if is-mac; then
# 	GO_LINTING_INSTALL='yes'
# 	GO_INSTALL+=(
# 	)
# fi
# 'github.com/cloudflare/utahfs/cmd/utahfs-client'

# macOS apps / mas
# https://github.com/mas-cli/mas
# '1472777122' 'Honey'
# '1484348796' 'Endel'
# '430798174' 'HazeOver'
# '441258766' 'Magnet'
# '441258766' 'Magnet'
# '497799835' 'Xcode'
# '497799835' 'XCode'
# '639968404' 'Parcel'
# '803453959' 'Slack'
# '931134707' 'Wire'
# '937984704' 'Amphetamine'
MAS_INSTALL=(
	'420212497' 'Byword'
	'405399194' 'Kindle'
	'409183694' 'Keynote'
	'409203825' 'Numbers'
	'409201541' 'Pages'
)

# Homebrew
if [[ $hostname == 'balupton-mini' ]]; then
	HOMEBREW_ENCODING_INSTALL=yes
fi
HOMEBREW_UNINSTALL=()
HOMEBREW_FORMULAS=(
	git-extras
	terminal-notifier
	tmux
	watchman
)
HOMEBREW_SLOW_FORMULAS=(
	'shellcheck'
)
# 'adguard'
# 'aerial'
# 'calibre'
# 'firefox'
# 'multipass'
# 'pocket-casts'
# 'raspberry-pi-imager'
# 'spotify'
# 'twitch'
# 'zoom'
HOMEBREW_CASKS=(
	'audio-hijack'
	'loopback'
	'soundsource'
)
# 'font-dejavu-sans-mono-nerd-font'
# 'font-fira-code-nerd-font'
# 'font-fira-mono-nerd-font'
# 'font-inconsolata-go-nerd-font'
# 'font-iosevka-nerd-font'
# 'font-jetbrains-mono-nerd-font'
# 'font-ubuntu-mono-nerd-font'
# 'font-ubuntu-nerd-font'
# 'font-victor-mono-nerd-font'
HOMEBREW_FONTS=(
	'font-cantarell'
	'font-cascadia-code'
	'font-dejavu'
	'font-fira-code'
	'font-fira-mono'
	'font-hack'
	'font-hasklig'
	'font-ibm-plex'
	'font-inter'
	'font-iosevka'
	'font-jetbrains-mono'
	'font-lato'
	'font-maven-pro'
	'font-monaspace'
	'font-monoid'
	'font-montserrat'
	'font-open-sans'
	'font-oxygen-mono'
	'font-oxygen'
	'font-pt-mono'
	'font-roboto-mono'
	'font-roboto'
	'font-source-code-pro'
	'font-ubuntu-mono'
	'font-ubuntu'
	'font-victor-mono'
)

# Ruby
# compass
# ffi
# sass
# twurl
# git-up, deprecated, fails to install on macos, replaced by `git-up` alias
GEM_INSTALL=()

# Python
# @todo swap PyPDF2 for one of the following
# > https://stackoverflow.com/a/63557138/130638
# - https://github.com/pymupdf/PyMuPDF
# - https://github.com/pikepdf/pikepdf
# - https://github.com/pdfminer/pdfminer.six
# pipx:
# 'youtube_dl'
# 'katcr'
# 'poetry'
# 'stig'
PIPX_INSTALL=()
# PYTHON3_PIP_INSTALL=('bitcoinlib' 'cairosvg')
# PYTHON2_PIP_INSTALL=('PyPDF2')

# Node.js
# SERVERS
# browser-refresh
# live-server
# DATABASE
# fauna-shell
# ECOSYSTEMS
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
# TOOLING
# tldr # replaced with tealdeer
# typescript@next
# CRYPTOCURRENCY
# cartera
# coinmon
NPM_INSTALL=(
	'@bevry/testen'
	'@bevry/github-api'
	'boundation'
	'serve'
	'eslint'
	'json'
	'typescript'
	'@githubnext/github-copilot-cli'
)
NODE_VERSIONS=(
	0.8
	0.10
	0.12
	4
	6
	8
	10
	12
	14
	16
	18
	20
	21
)

# Rust / Cargo / Crates.io
# --locked: Require Cargo.lock is up to date
# as rust packages can be supported by many package managers, and as cargo requires downloading every dependency, most rust packages are better installed via SETUP_UTILS
CARGO_INSTALL=()

# utilities
# setup-util-*
# 'warp' - caused too many issues, using adguard mac app instead
SETUP_UTILS=(
	1password-cli
	aria2
	bash
	bat
	bottom
	curl
	delta
	deno
	fish
	git
	gocryptfs
	jq
	nu
	obs
	prettier
	ps
	ripgrep
	sd
	strongbox
	tealdeer
	teip
	trash
	tree
	vim
)
