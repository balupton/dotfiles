#!/usr/bin/env pwsh

# Executed in  489.00 millis    fish           external
#    usr time  424.30 millis    0.12 millis  424.18 millis
#    sys time  181.99 millis    1.15 millis  180.84 millis

# Check for invalid arguments
param([string]$Path)
if (-not $Path) {
    exit 22  # EINVAL 22 Invalid argument
}

# Check for existence and accessibility
# If success, it exists and is accessible
# If failure, check if non-existence was due to non-accessible, or actually non-existence
try {
    $null = Get-Item -Path $Path -ErrorAction Stop
    exit 17  # EEXIST 17 File exists
} catch [System.Management.Automation.ItemNotFoundException] {
    exit 2   # ENOENT 2 No such file or directory
} catch [System.UnauthorizedAccessException] {
    exit 13  # EACCES 13 Permission denied
}
