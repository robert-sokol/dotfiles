#!/usr/bin/env bash

dotconf() {
    git --git-dir="$HOME"/.cfg/ --work-tree="$HOME"/ "$@"
}

echo ".cfg" > "$HOME"/.gitignore

mkdir -p "$HOME"/.config-backup

cd "$HOME"/.cfg/
for _file in $(git ls-tree -r main --name-only); do
    [[ -f "$HOME"/"$_file" ]] && mv "$HOME"/"$_file" "$HOME"/.config-backup/
    mv "$_file" "$HOME"/
done

dotconf config --local status.showUntrackedFiles no
