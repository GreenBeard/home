#!/bin/sh

# Niavely finds the largest packages (ignoring dependencies which extremely
# warps the results for packages that have most of their size in `*-data`, or a
# similar dependency). Prints out their size in kilobytes, and the names
# sorted. It could probably be sped up, and improved, but for now it works well
# enough.

set -e;

tmpdir="$(mktemp -d)";

dpkg-query -W --showformat='${Package}:${Architecture}\t${Priority}\n' | grep -E "optional" | cut -f1 > "$tmpdir/optional.txt";
aptitude search '~i !~M' -F '%p:%E' | cut -d: -f1-2 > "$tmpdir/manual.txt";

for package in $(grep -f "$tmpdir/optional.txt" "$tmpdir/manual.txt"); do
  dpkg-query -Wf '${Installed-Size}\t' "$package" >> "$tmpdir/result.txt";
  echo "$package" >> "$tmpdir/result.txt";
done
sort -h "$tmpdir/result.txt";
rm -r "$tmpdir";
