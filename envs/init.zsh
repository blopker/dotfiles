export NVM_DIR=~/.nvm

if hash rbenv 2> /dev/null; then eval "$(rbenv init -)"; fi
if hash pyenv 2> /dev/null; then eval "$(pyenv init -)"; fi
if hash brew 2> /dev/null; then source $(brew --prefix nvm)/nvm.sh; fi
