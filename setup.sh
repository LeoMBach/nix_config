#!/bin/bash

function copy_dotfiles() {
    dotfiles="$(find ./dotfiles/.* -maxdepth 0 -type f -printf '%f\n')"
    for dot in $dotfiles; do
        cp -vf ./dotfiles/$dot $HOME/$dot
    done;
}

function copy_mintty_themes() {
    if [ ! -d ~/.mintty/themes ]; then
        mkdir -p ~/.mintty/themes
    fi
    themes="$(find ./mintty_themes/*)"
    for theme in $themes; do
        cp -vf $theme ~/.mintty/themes 
    done;
}

function install_bash_git_prompt() {
    if [ ! -d ~/.bash-git-prompt ]; then
        git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
    else
        echo "bash-git-prompt is already installed: skipping!"
    fi
}

echo ""

echo "Copying dotfiles..."
copy_dotfiles
echo ""

echo "Installing mintty themes.."
copy_mintty_themes
echo ""

echo "Installing bash-git-prompt..."
install_bash_git_prompt
echo""

echo "DONE!"
