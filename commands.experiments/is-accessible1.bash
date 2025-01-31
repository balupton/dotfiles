#!/usr/bin/env bash

# Trim -- separator if present
if [[ $1 == '--' ]]; then
	shift
fi

# Check for invalid arguments
if [[ $# -ne 1 || -z $1 ]]; then
	exit 22 # EINVAL 22 Invalid argument
fi

# Check for existence and accessibility of source and target
# If success, source and target is accessible and does exist
# If failure, discern if non-existence was due to non-accessible, or actually non-existence
path="$1"
log="$(mktemp)"
status=0
stat -L -- "$path" 1>/dev/null 2>"$log" || status=$?
if [[ $status -ne 0 ]]; then
	if grep --quiet --regexp='stat: Permission denied$' -- "$log"; then
		# if it is a symlink, then it may or may not be broken, we need to escalate to find out
		exit 13 # EACCES 13 Permission denied
	elif grep --quiet --regexp='stat: No such file or directory$' -- "$log"; then
		# if it is a symlink, then it is accessible and broken
		if [[ -L $path ]]; then
			exit 9 # EBADF 9 Bad file descriptor
		fi
		# it is accessible and missing
		exit 2 # ENOENT 2 No such file or directory
	else
		# it is unknown, an unknown error occurred
		cat -- "$log" >/dev/stderr
		exit "$status"
	fi
elif [[ -d "$path" ]]; then
	exit 21 # EISDIR 21 Is a directory
else
	exit 17 # EEXIST 17 File exists
fi

# ENOENT 2 No such file or directory
# EBADF 9 Bad file descriptor
# EACCES 13 Permission denied
# EEXIST 17 File exists
# ENOTDIR 20 Not a directory
# EISDIR 21 Is a directory
# EFBIG 27 File too large
# ENOTEMPTY 66 Directory not empty
# EFTYPE 79 Inappropriate file type or format
