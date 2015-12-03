# screw .pyc
export PYTHONDONTWRITEBYTECODE=true

# Pyenv setup
if is-callable 'pyenv'; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
