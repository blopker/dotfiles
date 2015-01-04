#!/usr/bin/env bash

APT="sudo apt-get"

sudo add-apt-repository -y ppa:keepassx/daily
$APT update
$APT upgrade -y
$APT install -y nautilus-dropbox keepassx git
$APT install -y vim build-essential guake zsh curl wget
