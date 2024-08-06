#!/usr/bin/bash

declare -a stow_dirs=("nvim" "personal" "i3" "vaults")

## now loop through the above array
for i in "${stow_dirs[@]}"
do
    echo "stow $i"
    stow -D $i
done
