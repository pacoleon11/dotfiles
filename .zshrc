# Paco's zshrc

# ------------------------------------------------------------------------------
# env

export PATH="/opt/homebrew/bin:$PATH"

export FPATH="/opt/homebrew/share/zsh/site-functions:$FPATH"

export CLICOLOR=1

export HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

PROMPT='%F{75}%~%f %F{yellow}$(prompt_git_branch)%f$(prompt_env)%(?.%F{10}.%F{9})$%f '

# ------------------------------------------------------------------------------
# opt

setopt no_beep
setopt prompt_subst

unsetopt bang_hist
setopt extended_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt hist_verify

# ------------------------------------------------------------------------------
# zmod

# ------------------------------------------------------------------------------
# autoload

autoload -Uz compinit && compinit

# ------------------------------------------------------------------------------
# keybind

# ------------------------------------------------------------------------------
# alias

alias ll='ls -oh'
alias la='ls -oAh'

alias hex='printf "%#010x\n"'
alias dec='printf "%d\n"'

# ------------------------------------------------------------------------------
# func

# Rerun interminttenly passing/failing commands
function rerun(){
  case $1 in
    -p) local exit_on_pass="true"; action="passed"; shift;;
    -f) local exit_on_fail="true"; action="failed"; shift;;
  esac
  local -r n="${1:?number of runs not set}"
  shift
  case $n in
    ''|*[!0-9]*) echo "$0: '$n' is not integer"; return 1 ;;
  esac
  local -r cmd=$*
  for (( c=1; c<=$n; c++ )); do
    echo "$0${exit_on_fail:+-f}${exit_on_pass:+-p}: $c of $n: $cmd"
    eval $cmd; local rc=$?
    if [ $rc -eq 0 -a ${exit_on_pass:-x} = "true" -o $rc -ne 0 -a ${exit_on_fail:-x} = "true" ]; then
      echo "$0: command ${action:-} at $c of $n: $cmd"
      return $rc
    fi
  done
}

prompt_git_branch() {
  git branch 2> /dev/null | sed \
    -e '/^[^*]/d' \
    -e 's/^* //' \
    -e 's/(\(.*\))/\1/' \
    -e 's/^HEAD detached at //' \
    -e 's/.*/& /'
}

prompt_env(){} # To be overriden by each env

# ------------------------------------------------------------------------------
# completion

# ------------------------------------------------------------------------------
# hook

# ------------------------------------------------------------------------------
# external

if [[ -f ~/.zshrc.work ]]; then
  source ~/.zshrc.work
fi
if [[ -d ~/work ]]; then
  export CDPATH=~/work
fi
