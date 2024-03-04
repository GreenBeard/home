#!/bin/sh

# Finds packages that are both orphaned, and installed (on the local
# machine). The orphaned_raw.txt is created by just copying, and pasting the
# list from https://www.debian.org/devel/wnpp/orphaned.

set -e;

TMPDIR="$(mktemp -d)";
dpkg --get-selections | awk '{ if ($2 == "install") { print $1; } }' | cut -f1 -d: | sort | uniq > "$TMPDIR/installed.txt";
cut -f1 -d: ./orphaned_raw.txt | sort | uniq > "$TMPDIR/orphaned.txt";

comm -12 "$TMPDIR/installed.txt" "$TMPDIR/orphaned.txt";
rm -rf "$TMPDIR";
