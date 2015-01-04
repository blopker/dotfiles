#!/usr/bin/env zsh

echo "Set up Prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "Change dotfiles remote so I caan push"
cd ~/.dotfiles && git remote set-url master git@github.com:blopker/dotfiles.git

echo "Running bootstrap..."
cd ~/.dotfiles && script/bootstrap

chsh -s /bin/zsh

echo "Done!"
