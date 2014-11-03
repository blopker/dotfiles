alias gl='git pull --prune'
alias gp='git push origin HEAD --tags'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gd='git diff'
alias ga="git add --all :/"
alias gc='git commit -am'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gbrm='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gg="git grep --ignore-case --line-number --full-name --color --break --heading --context 2 --show-function"
alias greset="git reset --hard"
alias gfb='git checkout -t origin/master -b' # Create new feature branch.

function gi() { curl -s https://www.gitignore.io/api/$@ ;}
