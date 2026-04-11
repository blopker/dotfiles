# Pipe my public key to my clipboard.
alias pubkey="more $ZSH/ssh/id_ed25519.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# BW ssh agent setup
export SSH_AUTH_SOCK=/Users/blopker/.bitwarden-ssh-agent.sock
