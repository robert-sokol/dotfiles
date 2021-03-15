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
