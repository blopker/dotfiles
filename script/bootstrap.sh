#!/usr/bin/env bash
#
# Link dotfiles.
set -ex

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)

echo ''

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

link_file () {
  local src=$1 dst=$2
  ln -sf "$src" "$dst"
  success "linked $src to $dst"
}

install_dotfiles () {
  echo 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

install_dotfiles

echo ''
echo 'All installed!'
