#!/usr/bin/env bash
# shellcheck disable=SC2034
# place all exports at the start, otherwise no bash v3 compatibility
export PYENV_VERSION SHELLCHECK_OPTS CARGO_NET_GIT_FETCH_WITH_CLI

# dorothy
# PYENV_VERSION='3.10.0'  # only accepts full versions

# general
SHELLCHECK_OPTS='-e SC2096 -e SC1090 -e SC1091 -e SC1071'
CARGO_NET_GIT_FETCH_WITH_CLI='true'
