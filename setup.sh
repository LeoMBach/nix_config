#!/bin/bash

dotfiles="$(find ./dotfiles/.* -maxdepth 0 -type f -printf '%f\n')"
for dot in $dotfiles; do
    cp -vf ./dotfiles/$dot $HOME/$dot
done;

if [ ! -d ~/.mintty/themes ]; then
    mkdir -p ~/.mintty/themes
fi
themes="$(find ./mintty_themes/*)"
for theme in $themes; do
    cp -vf $theme ~/.mintty/themes 
done;

if [ ! -d ~/.bash-git-prompt ]; then
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
fi
