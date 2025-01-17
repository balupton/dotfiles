#!/usr/bin/env ruby

# Executed in   90.11 millis    fish           external
#    usr time   65.18 millis    0.12 millis   65.06 millis
#    sys time   20.16 millis    1.10 millis   19.05 millis

# Check for invalid arguments
if ARGV.length != 1 || ARGV[0].empty?
    exit 22  # EINVAL 22 Invalid argument
end

# Check for existence and accessibility
# If success, it exists and is accessible
# If failure, check if non-existence was due to non-accessible, or actually non-existence
begin
    File.stat(ARGV[0])
    exit 17  # EEXIST 17 File exists
rescue Errno::ENOENT
    exit 2   # ENOENT 2 No such file or directory
rescue Errno::EACCES
    exit 13  # EACCES 13 Permission denied
end