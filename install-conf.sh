#!/usr/bin/env bash

dotconf() {
    git --git-dir="$HOME"/.cfg/ --work-tree="$HOME"/ "$@"
}

echo ".cfg" > "$HOME"/.gitignore

mkdir -p "$HOME"/.config-backup
mkdir -p "$HOME"/.cfg

for _file in $(git ls-tree -r main --name-only); do
    [[ -f "$HOME"/"$_file" ]] && mv "$HOME"/"$_file" "$HOME"/.config-backup/
    cp -f "$_file" "$HOME"/
done
rsync -a .git/ "$HOME"/.cfg/

dotconf config --local status.showUntrackedFiles no
