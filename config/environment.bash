#!/usr/bin/env bash

echo_var_set SHELLCHECK_OPTS '-e SC2096 -e SC1090 -e SC1091 -e SC1071'
echo_var_set CARGO_NET_GIT_FETCH_WITH_CLI true

# echo_var_set PYENV_VERSION 3.10.0  # only accepts full versions
