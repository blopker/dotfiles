# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gp='git push'
alias gd='git diff'
alias ga="git add -A"
alias gc='git commit -am'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias greset="git reset --hard"

# http://gitignore.io/
function gi() { curl http://gitignore.io/api/$@ ;}
