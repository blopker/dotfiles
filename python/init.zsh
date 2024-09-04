# screw .pyc
export PYTHONDONTWRITEBYTECODE=true

alias activate=". .venv/bin/activate"
alias venv="python -m venv .venv && activate"
alias serve="echo 'Serving: http://localhost:4836' && python -m http.server 4836"
alias rmpyc="find . -name \*.pyc -delete"
