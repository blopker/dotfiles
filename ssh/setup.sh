#!/usr/bin/env zsh
set -ex

mkdir -p ~/.ssh
chmod 700 ~/.ssh
cp ./ssh/config ~/.ssh/
chmod 600 ~/.ssh/config
