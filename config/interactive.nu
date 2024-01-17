#!/usr/bin/env nu

# load the dorothy defaults
source ~/.local/share/dorothy/config/interactive.nu

# Disable welcome banner
$env.config.show_banner = false

# Dorothy
$env.DOROTHY_THEME = 'starship'

# Custom
def greet [name] {
  ['hello' $name]
}
# for some reason [greet] is not available to the actual interactive shell
