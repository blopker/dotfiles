if (($ISOSX)); then
	source $(brew --prefix nvm)/nvm.sh
else
    export NVM_DIR="/home/blopker/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi
