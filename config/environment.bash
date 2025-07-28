#!/usr/bin/env bash
# shellcheck disable=SC2034
# place all export declarations (e.g. export VAR) before their definitions/assignments (VAR=...), otherwise no bash v3 compatibility

# support caching the environment
# __cache -- /opt/homebrew/bin/xxhsum -H3 || exit
__cache || exit

# dorothy
export HOMEBREW_RUBY_VERSION
HOMEBREW_RUBY_VERSION='default'

# general
export SHELLCHECK_OPTS CARGO_NET_GIT_FETCH_WITH_CLI
SHELLCHECK_OPTS='-e SC2096 -e SC1090 -e SC1091 -e SC1071'
CARGO_NET_GIT_FETCH_WITH_CLI='true'
