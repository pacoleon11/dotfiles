#!/bin/bash

set -eu

while getopts ":n" opt; do
  case $opt in
    n)
      function _dryrun() { printf >&2 '(dry-run) skipped: %s\n' "$*"; }
      dryrun=_dryrun
      ;;
    \?) # Unknown option
      echo >&2 "error: Unknown option -$OPTARG"
      exit 1
      ;;
  esac
done

dotfiles_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

exclude=(
  install.sh
  README.md
  LICENSE
)

echo "Installing dotfiles ..."

for file in $(git -C $dotfiles_dir ls-files); do

  [[ " ${exclude[*]} " =~ " $file " ]] && continue
  echo "  $file"

  src="$dotfiles_dir/$file"
  dst="$HOME/$file"
  ${dryrun:-} mkdir -p "$(dirname $dst)"
  ${dryrun:-} ln -sf "$src" "$dst"

done

echo "dotfiles installed"
