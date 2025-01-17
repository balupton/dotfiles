#!/usr/bin/env -Sdeno run --quiet --no-config --no-lock --no-npm --allow-read

// Executed in   57.87 millis    fish           external
//    usr time   37.22 millis    0.12 millis   37.10 millis
//    sys time   22.28 millis    1.12 millis   21.15 millis

// Check for invalid arguments
if (Deno.args.length !== 1 || !Deno.args[0]) {
	Deno.exit(22) // EINVAL 22 Invalid argument
}

// Check for existence and accessibility
// If success, it exists and is accessible
// If failure, check if non-existence was due to non-accessible, or actually non-existence
try {
	await Deno.stat(Deno.args[0])
	Deno.exit(17) // EEXIST 17 File exists
} catch (error) {
	if (error instanceof Deno.errors.NotFound) Deno.exit(2) // ENOENT
	if (error instanceof Deno.errors.PermissionDenied) Deno.exit(13) // EACCES
}
