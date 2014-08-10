# Find out what ports are in use
alias ports="netstat -tulpn"

# Get python to make a simple http server in current dir
alias server="python -m SimpleHTTPServer"

# Reconnect or start a tmux or screen session over ssh
sssh (){ ssh -t "$1" 'tmux attach || tmux new || screen -DR'; }

# Make directory and change into it.
md (){ mkdir -p "$*"; cd "$*"; }

# Alias pbcopy from OSX
if [ "$(uname -s)" != "Darwin" ]
    then
    alias pbcopy='xclip -selection clipboard'
fi

# scp, but zip it first.
tarcp (){ tar czf - $1 | ssh $2 "cat > jdhkf837dsf.tar; tar xzf jdhkf837dsf.tar; rm jdhkf837dsf.tar" }
  
# credit: http://nparikh.org/notes/zshrc.txt
# Usage: extract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
extract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.dmg)      hdiutil mount $1                    ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.Z)        uncompress $1                       ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
