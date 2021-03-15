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

