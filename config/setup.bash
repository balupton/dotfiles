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
	gnupg
	tree
	wget
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
APT_INSTALL=(
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

# Snap
# https://code.visualstudio.com/docs/setup/linux
# if [[ "$(get-arch)" == 'x'* ]]; then
SNAP_INSTALL=()

# Go
GO_LINTING_INSTALL=no
GO_INSTALL=(
	'github.com/uw-labs/strongbox'
)
if is-mac; then
	GO_INSTALL+=(
		'changkun.de/x/rmtrash'
		# 'github.com/cloudflare/utahfs/cmd/utahfs-client'
	)
fi

# macOS apps / mas
# https://github.com/mas-cli/mas
# 441258766 "Magnet"
# 497799835 "XCode"
# 803453959 "Slack"
# 931134707 "Wire"
# 937984704 "Amphetamine"
MAS_INSTALL=(
	'420212497' 'Byword'
	'1484348796' 'Endel'
	'430798174' 'HazeOver'
	'1472777122' 'Honey'
	'409183694' 'Keynote'
	'405399194' 'Kindle'
	'441258766' 'Magnet'
	'409203825' 'Numbers'
	'409201541' 'Pages'
	'639968404' 'Parcel'
	'497799835' 'Xcode'
)

# Homebrew
HOMEBREW_ENCODING_INSTALL=no
HOMEBREW_UNINSTALL=(
	'hashicorp/tap/boundary'
	'hashicorp/tap/consul'
	'hashicorp/tap/nomad'
	'hashicorp/tap/terraform'
	'hashicorp/tap/vault'
	'imagemagick'
	'jswidler/tap/lockgit'
	'podman'
	'tmux'
)
HOMEBREW_FORMULAS=(
	'git-extras'
	'greymd/tools/teip'
	'micro'
	'terminal-notifier'
	'tree'
	'watch'
	'tmux'
	'watchman'
)
HOMEBREW_SLOW_FORMULAS=(
	'shellcheck'
)
HOMEBREW_CASKS=(
	'1password-cli'
	'adguard'
	'audio-hijack'
	'calibre'
	'cloudflare-warp'
	'firefox'
	'loopback'
	'meld'
	'multipass'
	'obs'
	'pocket-casts'
	'raspberry-pi-imager'
	'signal'
	'soundsource'
	'spotify'
	'twitch'
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
GEM_INSTALL=(
	git-up
)

# Python
# @todo swap PyPDF2 fro one of the following
# > https://stackoverflow.com/a/63557138/130638
# - https://github.com/pymupdf/PyMuPDF
# - https://github.com/pikepdf/pikepdf
# - https://github.com/pdfminer/pdfminer.six
PIPX_INSTALL=('youtube_dl' 'stig' 'katcr' 'poetry')
# PYTHON3_PIP_INSTALL=('bitcoinlib' 'cairosvg')
# PYTHON2_PIP_INSTALL=('PyPDF2')

# Node.js
NPM_INSTALL=(
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

# Rust / Cargo / Crates.io
# --locked: Require Cargo.lock is up to date
# as rust packages can be supported by many package managers, and as cargo requires downloading every dependency, most rust packages are better installed via SETUP_UTILS
CARGO_INSTALL=()

# utilities
# setup-util-*
SETUP_UTILS=(
	'aria2'
	'bandwhich'
	'bash'
	'bat'
	'bottom'
	'curl'
	'delta'
	'deno'
	'devel'
	'driveinfo'
	'dust'
	'exa'
	'fd'
	'fish'
	'gh'
	'git'
	'glab'
	'gocryptfs'
	'grex'
	'gsed'
	'httpie'
	'hyperfine'
	'jq'
	'mas'
	'procs'
	'python'
	'ripgrep'
	'rmesg'
	'screen'
	'sd'
	'starship'
	'tealdeer'
	'tokei'
	'vim'
	'wget'
	'zoxide'
)
