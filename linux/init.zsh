if [ -z $ISOSX ]; then
	# Remap capslock to f12
  setxkbmap -option caps:none && xmodmap -e "keycode 66 = F12"
fi
