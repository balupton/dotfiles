#!/usr/bin/env bash
# shellcheck disable=SC2034
# place all export declarations (e.g. export VAR) before their definitions/assignments (VAR=...), otherwise no bash v3 compatibility

# cache_validity_seconds=600 # six hundred seconds in ten minutes
# cache_checksum_tool='/opt/homebrew/bin/xxhsum' # xxhsum and b2sum are equivalent in speed, then openssl sha256, then b3sum
# if [[ -n "$cache_validity_seconds" && -x "$cache_checksum_tool" ]]; then
# 	pid=$$
# 	now_env="$(env -u TERM_SESSION_ID | sort)"
# 	context_id="$shell-$("$cache_checksum_tool" <<<"$now_env" | cut -f1 -d ' ')"
# 	lock_file="$XDG_CACHE_HOME/dorothy-environment-$context_id.lock" # this file is the process id that has the lock
# 	result_file="$XDG_CACHE_HOME/dorothy-environment-$context_id.result" # this file is the environment modifications for the environment vars we are valid for
# 	# wait for a exclusive lock
# 	while :; do
# 		# don't bother with a [[ -s "$lock_file" ]] before [cat] as the lock_file could have been removed between
# 		wait="$(cat "$lock_file" 2>/dev/null || :)"
# 		if [[ -z "$wait" ]]; then
# 			__print_string "$pid" >"$lock_file"
# 		elif [[ "$wait" == "$pid" ]]; then
# 			break
# 		elif [[ "$(ps -p "$wait" &>/dev/null || __print_string dead)" == 'dead' ]]; then
# 			rm -f "$lock_file" # the process is dead, it probably crashed, so failed to cleanup, so remove
# 		fi
# 		sleep "0.01$RANDOM"
# 	done
# 	# if cache is available and applicable
# 	if [[ -f "$result_file" ]]; then
# 		# if cache is still valid
# 		local now_seconds cache_seconds cache_ago_seconds
# 		now_seconds="$(date +%s)"
# 		cache_seconds="$(date -r "$result_file" +%s)"
# 		cache_ago_seconds="$((now_seconds - cache_seconds))"
# 		if [[ "$cache_ago_seconds" -lt "$cache_validity_seconds" ]]; then
# 			# then use the cache
# 			trap - EXIT # remove the prior trap, as we are using our cache result, rather than a new env.bash result
# 			cat "$result_file"
# 			rm -f "$lock_file"
# 			exit
# 		else
# 			: # __print_lines 'CACHE INVALIDATED' >/dev/tty
# 		fi
# 	else
# 		: # __print_lines 'CACHE NOT FOUND' >/dev/tty
# 	fi
# 	# cache needs updating
# 	function on_env_finish_cache {
# 		local status=$?
# 		if [[ $status -ne 0 ]]; then
# 			rm -f "$lock_file"
# 			return $status
# 		fi
# 		# store the result
# 		on_env_finish | tee "$result_file" || {
# 			status=$?
# 			rm -f "$lock_file"
# 			return $status
# 		}
# 		rm -f "$lock_file"
# 		return 0
# 	}
# 	trap on_env_finish_cache EXIT # replace our prior trap with one that caches the result
# fi

# dorothy
export HOMEBREW_RUBY_VERSION
HOMEBREW_RUBY_VERSION='default'

# general
export SHELLCHECK_OPTS CARGO_NET_GIT_FETCH_WITH_CLI
SHELLCHECK_OPTS='-e SC2096 -e SC1090 -e SC1091 -e SC1071'
CARGO_NET_GIT_FETCH_WITH_CLI='true'
