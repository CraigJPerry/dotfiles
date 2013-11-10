#!/bin/bash # Never actually run directly, helps syntax highlighter though
################################################################################
# Clear Screen on Logout (do not invoke when closing nested shells)
################################################################################
if [[ "0$SHLVL" -le 1 ]] && [[ "$TERM" != xterm* ]]; then
    clear
fi

