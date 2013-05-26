# Find out what ports are in use
alias ports="netstat -tulpn"

# Get python to make a simple http server in current dir
alias server="python -m SimpleHTTPServer"

# Reconnect or start a tmux or screen session over ssh
sssh (){ ssh -t "$1" 'tmux attach || tmux new || screen -DR'; }

# Make directory and change into it.
md (){ mkdir -p "$*"; cd "$*"; }
