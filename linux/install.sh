#!/usr/bin/env bash

APT="sudo apt-get"

sudo add-apt-repository -y ppa:keepassx/daily
$APT update
$APT install -y nautilus-dropbox keepassx git
$APT install -y vim build-essential nodejs sublime-text guake zsh curl wget

echo "Set up Prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh

echo "Cloning dotfiles..."
git clone https://github.com/blopker/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && git remote set-url master git@github.com:blopker/dotfiles.git

echo "Running bootstrap..."
cd ~/.dotfiles
script/bootstrap

echo "Done!"
