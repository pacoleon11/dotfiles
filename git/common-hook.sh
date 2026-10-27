#!/usr/bin/env zsh

[[ "${GIT_HOOK_LOCAL_DEBUG:-0}" = "0" ]] && QUIET=--quiet || set -x

is_commit_checkout=false
[ "$hook" = "post-checkout" ] && [ "${3:-0}" = "1" ] && [ "${1:-}" != "${2:-}" ] && is_commit_checkout=true

is_rewrite=false
[ "$hook" = "post-rewrite" ] && is_rewrite=true

is_rebase=false
$is_rewrite && [ "$1" = "rebase" ] && is_rebase=true

is_commit=false
[ "$hook" = "post-commit" ] && is_commit=true

is_merge=false
[ "$hook" = "post-merge" ] && is_merge=true

# ---

# echo "common-hook.sh: $hook $@"
# echo "$hook: is_merge $is_merge | is_commit_checkout $is_commit_checkout | is_rebase $is_rebase | is_commit $is_commit | is_merge $is_merge"

if $is_merge || $is_commit_checkout || $is_rebase; then

  echo "$hook: updating tags, submodules ..."
  tags >/dev/null 2>&1 &
  git submodule update --recursive --jobs 12

fi
