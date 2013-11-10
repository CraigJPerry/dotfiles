#!/bin/bash # Never actually run directly, helps syntax highlighter though
################################################################################
# Bash Aliases, Functions and Helpers
################################################################################
 
 
################################################################################
# Misc Colour Options
################################################################################
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
 
 
################################################################################
# Everyday Shortcuts
################################################################################
alias ..='cd ..'
alias .-='cd -'
alias ll='ls -lrt'
alias la='ls -lrta'
alias c='clear'
alias d='date'
alias vi='vim'
 
# Grep for a running process
alias pg='ps -ef | head -n1 ; ps -ef | grep -v grep | grep -i'
 
function addtopath {
    # addtopath <path>
    #   If no <path> then use pwd
    #   Temporarily, until shell is closed, add a given dir to $PATH
    if [ "x$1" != "x" ] && [ -d $1 ]; then
        export PATH="$1:$PATH"
    else
        export PATH="$( pwd ):$PATH"
    fi
}
 
function sumcol {
    # Read stdin, summing a given column number
    if [ "$1" != "" ]; then
        awk "{ total += \$$1; print } END { print \"Column \" $1 \" total: \" total }"
    fi
}
 
 
################################################################################
# Rarer, but useful shortcuts
################################################################################
# I use this a lot during release work, it makes it p ss easy to answer "when?"
alias stamp="echo \"  [====================  \`date \"+%Y-%m-%d %H:%M:%S\"\`  ====================]  \""
 
function lookbusy()
{
    # Never used, honest guv
    cat /dev/urandom | hexdump -C | grep "ca fe"
}
 
################################################################################
# MacOS Specific Aliases
################################################################################
if [ $_UNAME == "Darwin" ]; then
    alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
    alias sysout='sudo tail -1000f /var/log/system.log'
fi

