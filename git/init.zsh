alias ga="git add --all :/"
alias gam="git commit --amend -C HEAD"
alias gb='git branch'
alias gbrm=git-delete-local-merged
alias gc='git commit -am'
alias gcod='git checkout develop'
alias gcom='git checkout main'
alias gd='git diff --diff-algorithm=minimal'
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

# Function to open GitHub PR or main page
open_github_pr() {
  # Get the remote URL
  local remote_url=$(git remote get-url origin 2>/dev/null)

  # Check if we're in a git repository
  if [ $? -ne 0 ]; then
    echo "Error: Not in a git repository."
    return 1
  fi

  # Extract the GitHub repository URL from the git remote URL
  # This handles both SSH and HTTPS formats
  if [[ $remote_url == https://github.com/* ]]; then
    # HTTPS format: https://github.com/username/repo.git
    local github_url=${remote_url%.git}
  elif [[ $remote_url == git@github.com:* ]]; then
    # SSH format: git@github.com:username/repo.git
    local github_url="https://github.com/${remote_url#git@github.com:}"
    github_url=${github_url%.git}
  else
    echo "Not a GitHub repository or unsupported URL format: $remote_url"
    return 1
  fi

  # Get current branch name
  local current_branch=$(git branch --show-current)

  # Function to open URL based on platform
  open_url() {
    local url=$1

    # Try different commands to open the URL
    if command -v xdg-open &>/dev/null; then
      xdg-open "$url"
    elif command -v open &>/dev/null; then
      open "$url"
    elif command -v gnome-open &>/dev/null; then
      gnome-open "$url"
    elif command -v kde-open &>/dev/null; then
      kde-open "$url"
    else
      echo "Could not find a command to open URLs on your system."
      echo "URL: $url"
      return 1
    fi
  }

  # If we're on main/master branch, just open the repo page
  if [[ $current_branch == "main" || $current_branch == "master" ]]; then
    echo "Opening GitHub repository page..."
    open_url "$github_url"
  else
    # Otherwise, open the "Create PR" page for the current branch
    echo "Opening GitHub PR page for branch: $current_branch"
    open_url "$github_url/compare/$current_branch?expand=1"
  fi
}

# Create an alias
alias gpr='open_github_pr'
