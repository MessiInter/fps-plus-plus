#!/usr/bin/env bash

set -eu
shopt -s nocasematch

cd 1.16.5

mods_links="../modlinks.txt"

for i in $(cat $mods_links); do
  # https://unix.stackexchange.com/questions/132480/case-insensitive-substring-search-in-a-shell-script
  if echo $i | grep -iqF "curseforge"; then pw cf add "$i"; fi
  if echo $i | grep -iqF "modrinth"; then pw mr add "$i"; fi
done

exit $?
