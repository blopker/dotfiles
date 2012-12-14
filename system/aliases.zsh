# overides for ls
alias ls="ls -F --color"
alias l="ls -lAh --color"
alias ll="ls -l --color"
alias la='ls -A --color'

# Find out what ports are in use
alias ports="netstat -tulpn"

# Open folder in current location
manager_path=$(which thunar)
if [[ -f $manager_path ]]
  then
    alias o="$manager_path ./"
fi

