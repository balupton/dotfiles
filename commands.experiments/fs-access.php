#!/usr/bin/env php
<?php

// Executed in  122.93 millis    fish           external
//    usr time   74.93 millis    0.10 millis   74.83 millis
//    sys time   30.04 millis    1.14 millis   28.89 millis

# Check for invalid arguments
if ($argc !== 2 || empty($argv[1])) {
    exit(22);  // EINVAL 22 Invalid argument
}

# Check for existence and accessibility
# If success, it exists and is accessible
# If failure, check if non-existence was due to non-accessible, or actually non-existence
try {
    @stat($argv[1]);  // @ suppresses warnings
    exit(17);  // EEXIST 17 File exists
} catch (Exception $e) {
    if (str_contains($e->getMessage(), 'No such file')) exit(2);    // ENOENT 2 No such file or directory
    if (str_contains($e->getMessage(), 'Permission denied')) exit(13);  // EACCES 13 Permission denied
	exit($e.getCode() ?? 1);
}
