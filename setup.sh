#!/bin/bash

dotfiles="$(find .* -maxdepth 0 -type f)"
for dot in $dotfiles; do
    cp -vf $dot $HOME/$dot
done;
