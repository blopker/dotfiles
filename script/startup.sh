#!/usr/bin/env bash

setxkbmap -option caps:none && xmodmap -e "keycode 66 = F12"

guake &
