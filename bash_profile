#!/bin/bash # Never actually run directly, helps syntax highlighter though
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH

