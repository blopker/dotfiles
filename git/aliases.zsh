alias ga="git add --all :/"
alias gam="git commit --amend -C HEAD"
alias gb='git branch'
alias gbrm=git-delete-local-merged
alias gc='git commit -am'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch --all --prune'
alias gfind='git ls-files'
alias gg="git grep --ignore-case --line-number --full-name --color --break --heading --context 2 --show-function"
alias gl='git pull'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gme="glog --author=\"Bo Lopker\""
alias gp='git push origin HEAD --tags'
alias greset="git reset --hard"
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gs='git status -sb'

# Create new feature branch.
gfb() { git checkout -b feature/$1; }

gi() { curl -s https://www.gitignore.io/api/$@ ;}
