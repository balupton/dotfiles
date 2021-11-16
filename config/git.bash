#!/usr/bin/env bash
# shellcheck disable=SC2034
# do not use `export` keyword in this file

if test -n "${GPG_SIGNING_KEY-}"; then
	GIT_PROTOCOL='ssh'
else
	GIT_PROTOCOL='https'
fi

GIT_DEFAULT_BRANCH='main'
