#!/usr/bin/env zsh
set -ex

HTTP_GIT="https://github.com/blopker/dotfiles.git"
SSH_GIT="git@github.com:blopker/dotfiles.git"

set_git_urls () {
	# Change dotfiles remote so I can push
	git remote set-url origin $SSH_GIT || true
	# Set up HTTP remote for easy pull
	git remote add http $HTTP_GIT || true
}

install_prezto () {
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" || true
  setopt EXTENDED_GLOB

  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
}

echo "Set up dotfiles..."
set_git_urls

echo "Set up Prezto..."
install_prezto

echo "Running install_symlinks.sh symlinks..."
./script/install_symlinks.sh symlinks

echo "Setup SSH..."
./ssh/setup.sh

chsh -s /bin/zsh

echo "Done!"
echo "Now run OS specific script, in osx or linux folders."
