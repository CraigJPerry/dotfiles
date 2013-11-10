#!/bin/bash # Never actually run directly, helps syntax highlighter though
################################################################################
# Bash RC, Craig J Perry
################################################################################
 
# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return
 
################################################################################
# Path Setup
################################################################################
PATH="~/bin"                                 # Personal location
PATH="$PATH:/opt/local/bin:/opt/local/sbin"  # Vendor location
PATH="$PATH:/usr/local/bin:/usr/local/sbin"  # Locally packaged location
PATH="$PATH:/bin:/sbin:/usr/bin:/usr/sbin"   # Standard unix location
PATH="$PATH:~/.local/bin"                    # Python "user site" bin dir
 
# Now that uname is on the path, gather Information From This Host.
# These are all deleted at the end of this file.
_UNAME="$( uname )"
 
if [ $_UNAME == "SunOS" ]; then
    PATH="$PATH:/usr/sfw/bin:/usr/sfw/sbin"     # GNU tools etc. on Sol10+
fi
export PATH
 
 
################################################################################
# Basic Shell Setup
################################################################################
stty sane                   # Fix most terminal and keymapping issues
shopt -s checkwinsize       # Handle resizing of the terminal window
shopt -s extglob            # More powerful globbing, e.g. ls !(*.old)
umask 027                   # File perms created as -rw-r----- dirs drwxr-x---
 
 
################################################################################
# Shell History
################################################################################
shopt -s cmdhist            # Multi-line commands stored in history as 1 line
shopt -s histappend         # Prevent multiple open shells overwriting each
                            # other's history as they're closed
export HISTSIZE=1000        # Preserve this many hist items from a session
export HISTFILESIZE=100000  # Preserve history on disk for a long time!
HISTIGNORE="ls:ll:la"       # Be careful not to ignore useful info like cd cmds
export HISTIGNORE
export HISTCONTROL="ignoreboth"         # Don't log a sensitive command, e.g.
                                        # containing a password, if you
                                        # start the cmdline with a
                                        # space. Also don't log
                                        # duplicate entries.
HISTTIMEFORMAT="[%m-%d %H:%M] "
export HISTTIMEFORMAT                   # Wish i could include a hostname...
 
 
################################################################################
# Colours, not every host / terminal combo results in a working tput command...
################################################################################
# Reset
Color_Off='\e[0m'       # Text Reset
 
# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
 
# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White
 
# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White
 
# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White
 
# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White
 
# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White
 
# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[10;95m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White
 
if [ $_UNAME == "Darwin" ]; then
    # MacOS ls Colours
    export CLICOLOR=1
    export LSCOLORS="ExFxBxDxCxegedabagacad"
elif [ $_UNAME == "Linux" ]; then
    alias ls='ls --color=auto'
elif [ $_UNAME == "CYGWIN_NT-6.1-WOW64" ]; then
    alias ls='ls --color=auto'
    LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'
    export LS_COLORS
# TODO: Solaris, OpenBSD
fi
 
 
################################################################################
# Shell Prompt
################################################################################
# #1:413[user@host ~]$
#   #       If you've ever accidentally pasted a whole chunk of commands
#           you just copied, you'll appreciate why my prompt starts with a
#           comment character ;-)
#   1       The return code of the last command on the previous cmdline.
#           Only visible if the return code was non-zero.
#   413     History line number, having it visible makes history
#           substitution easier.
#   [...]   Standard prompt format, if other people need to use my
#           shell, they are not disorientated.
 
# Non-colour version
#   export PROMPT_COMMAND="r=\?;if [ \$r -ne 0 ]; then printf \"\$r\"; fi"
#   export PS1="#\![\u@\h \W]\$ "
#   export PS2="#--> "
#   export PS4='$0:$LINENO '
 
# Colour Version
export PROMPT_COMMAND="r=\$?;if [ \$r -ne 0 ]; then printf \"$IBlack#$IRed\$r$Color_Off\"; fi"
export PS1="\[$IBlack\]#\[$Green\]\!\[$White\][\u@\h \[$Blue\]\W\[$White\]]\$ \[$IWhite\]"
trap 'printf $Color_Off' DEBUG
export PS2="\[$IBlack\]#\[$White\]--> \[$IWhite$On_Black\]"
export PS4="\[$IBlack\]\$0:\$LINENO\[$Color_Off\] "
 
 
################################################################################
# Editor
################################################################################
export EDITOR="vim"
 
 
################################################################################
# Use Less As The Pager ('most' isn't widely available currently)
################################################################################
export PAGER="less"
# Case insensitive search, show status column, use visual bells, show
# percentage into the file, when you page through, mark the last line
# visible on the last screen.
#LESS="-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f :stdin"
#LESS="$LESS .?pb%pb\%:?lbLine %lb:?bbByte %bb:-..."
#export LESS
# Use the lesspipe helper if present, e.g. allows less archive.zip
# to produce meaningful output. Fall back to the common lesspipe script.
if [ -x lesspipe ]; then
    eval $(SHELL=/bin/sh lesspipe)
elif [ -x lesspipe.sh ]; then
    export LESSOPEN="|/usr/bin/lesspipe.sh %s"
fi
 
 
################################################################################
# Man Pages
################################################################################
MANPATH="/usr/share/man"                    # System provided
MANPATH="$MANPATH:/usr/local/share/man"     # Local packages
MANPATH="$MANPATH:/opt/local/man"           # Vendor provided
export MANPATH
 
 
################################################################################
# Setup X over SSH
################################################################################
# My PuTTY sessions always have X11 forwarding enabled. Needs an Xserver
# running obviously, e.g. Cygwin or Xming. Or better still, no putty, no Windows
export DISPLAY=:0.0
 
 
################################################################################
# Aliases
################################################################################
if [ -r ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
 
 
################################################################################
# Auto Completion
################################################################################
if [ -r ~/.bash_completion ]; then
    . ~/.bash_completion
fi
 
 
# Cleanup temporary variables
unset _UNAME

