# screw .pyc
export PYTHONDONTWRITEBYTECODE=true

alias activate=". .venv/bin/activate"
alias venv="python -m venv .venv && activate"
alias serve="miniserve --interfaces=127.0.0.1 --no-symlinks --index=index.html --disable-indexing --port 4836 ."
alias rmpyc="find . -name \*.pyc -delete"
