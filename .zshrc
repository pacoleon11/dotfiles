# Aliases
alias ll='ls -oh'
alias la='ls -oAh'

alias hex='printf "%#010x\n"'
alias dec='printf "%d\n"'

# Remove annoying beep
setopt no_beep

# color in ls
export CLICOLOR=1

# Enable colors
autoload -U colors && colors

# Brew binaries (prepended to PATH to take precedence)
export PATH="/opt/homebrew/bin:$PATH"

# Brew autocompletions
export FPATH="/opt/homebrew/share/zsh/site-functions:$FPATH"

# Enable auto-completion
autoload -Uz compinit && compinit

# Prompt
setopt prompt_subst
prompt_git_branch() {
  git branch 2> /dev/null | sed \
    -e '/^[^*]/d' \
    -e 's/^* //' \
    -e 's/(\(.*\))/\1/' \
    -e 's/^HEAD detached at //' \
    -e 's/.*/& /'
}
prompt_env(){} # To be overriden by work/personal environment prompt
PROMPT='%F{75}%~%f %F{yellow}$(prompt_git_branch)%f$(prompt_env)%(?.%F{10}.%F{9})$%f '

# Work integration
if [[ -f ~/.zshrc.work ]]; then
  source ~/.zshrc.work
fi
if [[ -d ~/work ]]; then
  export CDPATH=~/work
fi

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

# History
export HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
unsetopt BANG_HIST               # Treat the '!' character normally during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
