#!/usr/bin/env zsh
set -ex

mkdir -p ~/.ssh
chmod 700 ~/.ssh
cp ./config ~/.ssh/
chmod 600 ~/.ssh/config
