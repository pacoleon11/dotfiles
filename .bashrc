# User specific aliases and functions

alias tio='tio -m INLCRNL'
alias la='ll -a'
alias vim='vimx'

# git branch on terminal prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
export PS1="[\u@\h \W\[\033[33m\]\$(parse_git_branch)\[\033[00m\]]$ "

# Python startup
export PYTHONSTARTUP="$HOME/.pythonrc"
