#!/usr/bin/env bash
# shellcheck disable=SC2034
# do not use `export` keyword in this file

# load the dorothy defaults
source "$DOROTHY/config/setup.bash"

# note on youtube-dl
# brew maintains it actively, and also will assist with dependencies
# however, ubuntu is slow to maintain, so install via pip instead
# http://ytdl-org.github.io/youtube-dl/download.html

APK_INSTALL=(
	'tree'
)

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
GO_LINTING_INSTALL=no
GO_INSTALL=()
if is-mac; then
	GO_INSTALL+=(
		'changkun.de/x/rmtrash'
		# 'github.com/cloudflare/utahfs/cmd/utahfs-client'
	)
fi

# macOS apps / mas
# https://github.com/mas-cli/mas
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
	'1484348796' 'Endel'
	'1472777122' 'Honey'
	'409183694' 'Keynote'
	'405399194' 'Kindle'
	'409203825' 'Numbers'
	'409201541' 'Pages'
)

# Homebrew
HOMEBREW_ENCODING_INSTALL=yes
HOMEBREW_UNINSTALL=(
	'imagemagick'
	'podman'
	'tmux'
)
HOMEBREW_FORMULAS=(
	'git-extras'
	'terminal-notifier'
	'tmux'
	'tree'
	'watch'
	'watchman'
)
HOMEBREW_SLOW_FORMULAS=(
	'shellcheck'
)
# 'twitch'
HOMEBREW_CASKS=(
	'1password-cli'
	'adguard'
	'audio-hijack'
	'calibre'
	'firefox'
	'loopback'
	'multipass'
	'obs'
	'pocket-casts'
	'raspberry-pi-imager'
	'soundsource'
	'spotify'
	'zoom'
)
HOMEBREW_FONTS=(
	'font-cantarell'
	'font-cascadia-code'
	'font-fira-code'
	'font-fira-code-nerd-font'
	'font-fira-mono'
	'font-fira-mono-nerd-font'
	'font-hack'
	'font-hasklig'
	'font-ibm-plex'
	'font-inconsolata-go-nerd-font'
	'font-inter'
	'font-jetbrains-mono'
	'font-jetbrains-mono-nerd-font'
	'font-lato'
	'font-maven-pro'
	'font-monoid'
	'font-montserrat'
	'font-open-sans'
	'font-oxygen'
	'font-oxygen-mono'
	'font-roboto'
	'font-roboto-mono'
	'font-source-code-pro'
	'font-ubuntu'
)

# Ruby
# compass
# ffi
# sass
# twurl
# git-up, replaced by `git pull --rebase --autostash`
GEM_INSTALL=()

# Python
# @todo swap PyPDF2 fro one of the following
# > https://stackoverflow.com/a/63557138/130638
# - https://github.com/pymupdf/PyMuPDF
# - https://github.com/pikepdf/pikepdf
# - https://github.com/pdfminer/pdfminer.six
PIPX_INSTALL=(
	'katcr'
	'poetry'
	'stig'
	'youtube_dl'
)
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
	'boundation'
	'serve'
	'eslint'
	'json'
	'typescript'
)

# Rust / Cargo / Crates.io
# --locked: Require Cargo.lock is up to date
# as rust packages can be supported by many package managers, and as cargo requires downloading every dependency, most rust packages are better installed via SETUP_UTILS
CARGO_INSTALL=()

# utilities
# setup-util-*
# 'warp' - caused too many issues, using adguard mac app instead
SETUP_UTILS=(
	'aria2'
	'bash'
	'bat'
	'bottom'
	'curl'
	'delta'
	'deno'
	'devel'
	'dust'
	'exa'
	'fish'
	'git'
	'gocryptfs'
	'httpie'
	'jq'
	'prettier'
	'ripgrep'
	'sd'
	'signal'
	'starship'
	'strongbox'
	'tealdeer'
	'teip'
	'vim'
	'wget'
)
