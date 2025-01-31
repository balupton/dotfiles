#!/usr/bin/env bash

# Executed in   42.60 millis    fish           external
#    usr time   10.09 millis    0.20 millis    9.89 millis
#    sys time   22.57 millis    1.75 millis   20.82 millis

# Check for invalid arguments
[[ $# -ne 1 || -z $1 ]] && exit 22  # EINVAL

# Check for existence and accessibility
# If success, it exists and is accessible
# If failure, check if non-existence was due to non-accessible, or actually non-existence
log="$(mktemp)"
status=0
stat -L "$1" &>"$log" || status=$?
if [[ $status -eq 0 ]]; then
	exit 17 # EEXIST 17 File exists
elif grep --quiet --fixed-strings --regexp='No such file or directory' -- "$log"; then
	exit 2 # ENOENT 2 No such file or directory
elif grep --quiet --fixed-strings --regexp='Permission denied' -- "$log"; then
	exit 13 # EACCES 13 Permission denied
else
	exit "$status"
fi

# # Check for existence
# if [[ -e $1 || -L $1 ]]; then
# 	exit 17 # EEXIST 17 File exists
# fi

# # Now check if non-existence was due to non-accessible, or actually non-existence
# log="$(mktemp)"
# status=0
# stat -L "$1" &>"$log" || status=$?
# if [[ $status -ne 0 ]]; then
# 	if grep --quiet --fixed-strings --regexp='No such file or directory' -- "$log"; then
# 		exit 2 # ENOENT 2 No such file or directory
# 	fi
# 	if grep --quiet --fixed-strings --regexp='Permission denied' -- "$log"; then
# 		exit 13 # EACCES 13 Permission denied
# 	fi
# fi
# exit $status
