#!/bin/bash # Never actually run directly, helps syntax highlighter though
# .bashrc

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

shopt -s checkwinsize        # Handle resizing of the terminal window
shopt -s extglob             # More powerful globbing, e.g. ls !(*.old)

# Shell history control
shopt -s cmdhist             # Multi-line commands stored in history as 1 line
shopt -s histappend          # Multiple open shells append rather than clobber
export HISTSIZE=1000         # Preserve this many hist items in memory
export HISTFILESIZE=100000   # Preserve more (all?) on disk
HISTIGNORE="ls:pwd:gst"      # Be careful not to ignore useful info like cd cmd
export HISTIGNORE
HISTCONTROL="ignoreboth"     # Start cmdline with space to prevent history
export HISTCONTROL           # capturing passwords etc.
HISTTIMEFORMAT="[%m-%d %H:%M] "
export HISTTIMEFORMAT        # Wish i could include a hostname...

# Report non-zero return codes on next cmdline
export PROMPT_COMMAND="r=\$?;[[ \$r -ne 0 ]] && printf \$r"

# Include git branch name in $PS1 prompt
function parse_git_dirty {
  git diff --no-ext-diff --quiet --exit-code &> /dev/null || echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}
export PS1="[\u@\h \W]\$(parse_git_branch)\$ "

# Variables
export EDITOR="vim -f"       # Keep vim in foreground

# Aliases
alias vi="vim"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias c="clear"
alias d="date"
# Grep for a running process
alias pg="ps -ef | head -n1 ; ps -efH | grep -v grep | grep -i"
# This makes it easy to answer "when did you do X?" during releases
alias ts="echo \"  [====================  \`date \"+%Y-%m-%d %H:%M:%S\"\`  ====================]  \""
# Common git activities
alias gst="git branch -a && git status"
alias gdc="git diff --cached"
alias gd="git diff"
alias gm="git merge --no-ff"
alias ghm="git checkout master"
alias ghb="git checkout -b"
alias gcm="git commit"
alias gca="git commit -a"
alias grb="git reset HEAD~1"
alias gpo="git push origin"
alias gpl="git pull"
alias gl="git lg"            # See [aliases] in .gitconfig
alias gt="git tag -a"
alias gf="git fetch"

# Includes
if which virtualenvwrapper.sh > /dev/null 2>&1; then
    export PROJECT_HOME="$HOME/Code"
    export WORKON_HOME="$HOME/.virtualenvs"
    . $(which virtualenvwrapper.sh)
fi

if [[ -r ~/.bashrc.local ]]; then
    . ~/.bashrc.local
fi

