alias ga="git add --all :/"
alias gam="git commit --amend -C HEAD"
alias gb='git branch'
alias gbrm=git-delete-local-merged
alias gc='git commit -am'
alias gcod='git checkout develop'
alias gcom='git checkout main'
alias gd='git diff'
alias gf='git fetch --all --prune'
alias ggf='git ls-files | grep'
alias gg="git grep -I --ignore-case --line-number --full-name --color --break --heading --context 2 --show-function"
alias gglog='git log --patch -G '
alias gl='git pull'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gme="glog --author=\"Bo Lopker\""
alias gp='git push origin HEAD --tags'
alias greset="git reset --hard"
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gs='git status -sb'

gco() {
  git checkout "${@:-main}"
}

# Create new feature branch.
gfb() { git checkout -b feature/$1; }

# Generate a gitignore to stdout
# gi linux,osx,python
gi() { curl -sL https://www.gitignore.io/api/$@ ;}
