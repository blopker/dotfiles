# overides for ls
alias ls="ls -F --color"
alias l="ls -lAh --color"
alias ll="ls -l --color"
alias la='ls -A --color'

# Find out what ports are in use
alias ports="netstat -tulpn"

# Open folder in current location
if hash thunar 2>/dev/null
  then
    alias o="`which thunar` ./"
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

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# Make directory and change into it.
md (){ mkdir -p "$*"; cd "$*"; }
