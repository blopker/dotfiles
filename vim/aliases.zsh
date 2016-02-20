# always use vim!
alias vi="vim"

if (( $+commands[nvim] )); then
  alias vim="nvim"
fi
