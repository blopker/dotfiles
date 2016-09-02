#!/usr/bin/env zsh

HTTP_GIT=https://github.com/blopker/dotfiles.git
SSH_GIT=git@github.com:blopker/dotfiles.git
DOT_DIR=~/.dotfiles

echo "Set up dotfiles..."
git clone $HTTP_GIT $DOT_DIR
cd $DOT_DIR
# Change dotfiles remote so I can push
git remote set-url origin $SSH_GIT
# Set up HTTP remote for easy pull
git remote add http $HTTP_GIT

script/install.sh

echo "Set up Prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "Running bootstrap..."
cd ~/.dotfiles 
./script/bootstrap

chsh -s /bin/zsh

echo "Done!"
