# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PROJECTS=~/code
export ZSH=$HOME/.dotfiles
export PATH="$HOME/bin:$ZSH/bin:$PATH"
export PATH="/opt/homebrew/opt/uutils-coreutils/libexec/uubin:$PATH"

# OSX switch
# Example:
# if (($ISMACOS)) (or if ((! $ISMACOS)) )
# 	then
# 	do stuff
# fi
export ISMACOS=0
if [[ "$(uname -s)" == "Darwin" ]]
    then
    export ISMACOS=1
fi

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# all of our zsh files
typeset -U config_files
config_files=($ZSH/**/init.zsh)

# load everything but the path files
for file in ${config_files:#*/path.zsh}
do
  source $file
done

unset config_files

# Source cargo/rust if installed
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Source brew is installed``
[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Mise
eval "$(mise activate zsh)"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/blopker/.dart-cli-completion/zsh-config.zsh ]] && . /Users/blopker/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# bun completions
[ -s "/Users/blopker/.bun/_bun" ] && source "/Users/blopker/.bun/_bun"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/blopker/.lmstudio/bin"
# End of LM Studio CLI section

