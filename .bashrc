################################################################################
# Robert Sokol's personal .bashrc
################################################################################

[[ -z "$PS1" ]] && return # Do not do anything if not running interactively.

################################################################################
# Source global definitions
################################################################################

if [[ -f /etc/bashrc ]]; then
    . /etc/bashrc
fi

# Enable completion features.

if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
fi

# Enable case-insensitive completion and disable bell on partial completion.

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

################################################################################
# User Specific $PATH
################################################################################

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
    export PATH
fi

################################################################################
# Bash options
################################################################################

set -o notify                       #notify on background jobs completion.

shopt -s cdspell                    # Correct typos automatically.
shopt -s cdable_vars                # Enable cd to variables.
shopt -s checkhash                  # Check if command exists in hash-table before running.
shopt -s checkwinsize               # Update lines/cols after terminal resize.
shopt -s cmdhist                    # Save multi-line commands properly to history.
shopt -s no_empty_cmd_completion    # Prevent PATH searching for empty lines.
shopt -s sourcepath                 # Search path for sourcing.
shopt -s extglob                    # Enable extended pattern matching.

shopt -u mailwarn                   # Disabled mail file checking.
unset MAILCHECK                     # Disable email notifications.

################################################################################
# History options
################################################################################

shopt -s histappend
export HISTFILESIZE=100000
export HISTSIZE=10000
PROMPT_COMMAND='history -a'

#Ignore duplicate lines, do not log commands that start with space.
export HISTCONTROL=erasedups:ignoredups:ignorespace

stty -ixon # Enable reverse history search.

################################################################################
# Command output colors
################################################################################

export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'

alias grep="/usr/bin/grep --color=auto"

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

################################################################################
# Color definitions
################################################################################

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

################################################################################
# User testing for $PS1 prompt
################################################################################

if [[ $USER == root ]]; then #user is root
    SU="$BRed"
elif [[ "$USER" != "$(logname)" ]];then #user used sudo
    SU="$Red"
else
    SU="$BYellow" #regular user
fi

################################################################################
# $PS1 modifications
################################################################################

PS1="\["$SU"\]\u\["$NC"\]@\["$SU"\]\H\["$NC"\]:\["$BBlue"\][\w]\["$NC"\]:\$ "

################################################################################
# Exports
################################################################################

export EDITOR=vim
export VISUAL=vim

################################################################################
# Aliases
################################################################################

alias ls='ls --color'
alias ll='ls -lah --color'

# dotconf used to manage dotfiles in the repo.
alias dotconf="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
