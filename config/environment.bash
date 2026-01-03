#!/usr/bin/env bash
# shellcheck disable=SC2034
# place all export declarations (e.g. export VAR) before their definitions/assignments (VAR=...), otherwise no bash v3 compatibility

# support caching the environment
# __cache -- /opt/homebrew/bin/xxhsum -H3 || :
# __cache || :

# dorothy
export HOMEBREW_RUBY_VERSION
HOMEBREW_RUBY_VERSION='default'

# https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-with-cli
export CARGO_NET_GIT_FETCH_WITH_CLI
CARGO_NET_GIT_FETCH_WITH_CLI='true'
