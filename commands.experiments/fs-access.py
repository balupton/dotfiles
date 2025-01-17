#!/usr/bin/env python3
# trunk-ignore-all(flake8/E501)

# Executed in   51.94 millis    fish           external
#    usr time   30.49 millis    0.11 millis   30.38 millis
#    sys time   13.91 millis    1.10 millis   12.82 millis

# Requirements
import os
import sys

# Check for invalid arguments
if len(sys.argv) != 2 or not sys.argv[1]:
    sys.exit(22)  # EINVAL 22 Invalid argument

# Check for existence and accessibility
# If success, it exists and is accessible
# If failure, check if non-existence was due to non-accessible, or actually non-existence
try:
    os.stat(sys.argv[1])
    sys.exit(17)  # EEXIST 17 File exists
except FileNotFoundError:
    sys.exit(2)  # ENOENT 2 No such file or directory
except PermissionError:
    sys.exit(13)  # EACCES 13 Permission denied
