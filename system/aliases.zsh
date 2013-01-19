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

# Get python to make a simple http server in current dir
alias server="python -m SimpleHTTPServer"

# Reconnect or start a tmux or screen session over ssh
sssh (){ ssh -t "$1" 'tmux attach || tmux new || screen -DR'; }

# Simulate OSX's pbcopy and pbpaste on other platforms
if [ ! $(uname -s) = "Darwin" ]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi
