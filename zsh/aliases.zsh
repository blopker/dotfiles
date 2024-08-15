alias reload!='. ~/.zshrc'
alias update="_update && reload!"
alias lic="cp $ZSH/LICENSE LICENSE"
alias c="cd $PROJECTS"
alias rm='nocorrect rm'
alias x='unarchive'
alias sl='ls'

# Unalias e from the utilities module so we don't have to type '.' all the time.
unalias e
function e(){
    ${(z)VISUAL:-${(z)EDITOR}} ${@:-.}
}

# Find out what ports are in use
alias ports="netstat -tulpn"

# Spoof MAC address (ex spoof 00:00:00:00:00:00)
# Use Monitor Mode to capture packets. Need to disconnect from wifi.
# 'dns' is a good packet filter
spoof(){
   echo "Disconnect from any wifi, do not turn off wifi"
   sudo ifconfig en0 ether "$1"
   sudo ifconfig en0 down
   sleep 1
   sudo ifconfig en0 up
}

alias proxy="echo 'proxy at 127.0.0.1:3128' && ssh -D 3128 -CN kbl.io -p 3128"

# Make directory and change into it.
md (){ mkdir -p "$*"; cd "$*"; }

# Alias pbcopy from OSX
if ((! $ISMACOS))
    then
    alias pbcopy='xclip -selection clipboard'
fi
