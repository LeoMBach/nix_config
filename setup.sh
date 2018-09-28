#!/bin/bash

dotfiles="$(find .* -maxdepth 0 -type f)"
for dot in $dotfiles; do
    cp -vf $dot $HOME/$dot
done;

if [ ! -d "~/.mintty/themes" ]; then
    mkdir -p ~/.mintty/themes
fi
themes="$(find ./mintty_themes/*)"
for theme in $themes; do
    cp -vf $theme ~/.mintty/themes 
done;
