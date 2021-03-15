#!/usr/bin/env bash

dotconf() {
    git --git-dir="$HOME"/.cfg/ --work-tree="$HOME"
}

echo ".cfg" >> "$HOME"/.gitignore

mkdir -p "$HOME"/.config-backup && \
dotconf checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | \
xargs -I{} mv {} .config-backup/{}

dotconf config --local status.showUntrackedFiles no

. "$HOME"/.bash_profile
