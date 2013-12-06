#!/usr/bin/env bash 
 
echo "Set up Prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh

echo "Cloning dotfiles..."
git clone git@github.com:blopker/dotfiles.git ~/.dotfiles

echo "Running bootstrap..."
cd ~/.dotfiles
script/bootstrap

echo "Done!"
