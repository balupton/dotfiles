#!/usr/bin/env bash

if test -n "${GPG_SIGNING_KEY-}"; then
	export GIT_PROTOCOL='ssh'
else
	export GIT_PROTOCOL='https'
fi

export GIT_DEFAULT_BRANCH='main'
