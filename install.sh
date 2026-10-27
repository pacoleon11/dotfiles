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
  .gitignore
  install.sh
  README.md
  LICENSE
)

echo "Installing dotfiles ..."

# Tracked directories at the repo root go to ~/.config, tracked files to ~
for name in $(git -C $dotfiles_dir ls-files | cut -d/ -f1 | uniq); do

  [[ " ${exclude[*]} " =~ " $name " ]] && continue

  src="$dotfiles_dir/$name"
  if [[ -d "$src" ]]; then
    dst="$HOME/.config/$name"
  else
    dst="$HOME/$name"
  fi

  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    echo "  $name (already linked)"
    continue
  fi

  if [[ -e "$dst" || -L "$dst" ]]; then
    echo >&2 "error: $dst exists and is not a link to $src, remove it first"
    exit 1
  fi

  echo "  $name -> $dst"
  ${dryrun:-} mkdir -p "$(dirname $dst)"
  ${dryrun:-} ln -s "$src" "$dst"

done

echo "dotfiles installed"
