#!/usr/bin/env perl

# Executed in   22.70 millis    fish           external
#    usr time    8.94 millis    0.12 millis    8.82 millis
#    sys time   11.10 millis    1.12 millis    9.98 millis

# Requirements
use strict;
use warnings;

# Check for invalid arguments
if ( @ARGV != 1 || !$ARGV[0] ) {
	exit 22;  # EINVAL 22 Invalid argument
}

# Check for existence and accessibility
# If success, it exists and is accessible
# If failure, check if non-existence was due to non-accessible, or actually non-existence
if (stat($ARGV[0])) {
    exit 17;  # EEXIST 17 File exists
} elsif ($! == 2) {  # ENOENT
    exit 2;   # No such file or directory
} elsif ($! == 13) {  # EACCES
    exit 13;  # Permission denied
} else {
	exit $!; # Return the error code
}
