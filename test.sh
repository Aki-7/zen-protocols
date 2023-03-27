#!/bin/sh

for file in "$@"
do
  echo >&2 "Checking $file"
  wayland-scanner -s client-header "$file" /dev/null
	wayland-scanner -s server-header "$file" /dev/null
	wayland-scanner -s public-code "$file" /dev/null
	wayland-scanner -s private-code "$file" /dev/null
done
