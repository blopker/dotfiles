alias reload!='. ~/.zshrc'
alias update="_update && reload!"
alias lic="cp $ZSH/LICENSE LICENSE"
alias as='alias | grep'
alias c="cd $PROJECTS"
alias rm='nocorrect rm'
alias dot="cd $ZSH"
alias x='unarchive'
alias notes="e ~/Dropbox/notes"

# Find out what ports are in use
alias ports="netstat -tulpn"

# Spoof MAC address (ex spoof 00:00:00:00:00:00)
alias spoof="sudo ifconfig en0 ether"

# Make directory and change into it.
md (){ mkdir -p "$*"; cd "$*"; }

# Alias pbcopy from OSX
if ((! $ISOSX))
    then
    alias pbcopy='xclip -selection clipboard'
fi

# scp, but zip it first.
tarcp (){ TEMPNAME="`date +%s`.tar"; tar czf - $1 | ssh $2 "cat > $TEMPNAME; tar xzf $TEMPNAME; rm $TEMPNAME" }
