# screw .pyc
export PYTHONDONTWRITEBYTECODE=true

# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if hash pyenv 2> /dev/null; then eval "$(pyenv init -)"; fi
