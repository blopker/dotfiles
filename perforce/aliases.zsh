export P4PORT='p4:1666'
export P4CONFIG='.p4config'
export P4EDITOR=vim
export P4DIFF='vimdiff'
export P4USER=$USER
export P4_HOME=~/bin/

alias p4o='p4 opened'
alias p4od='p4 opened -c default'
alias p4of='p4 opened | p4f'
alias p4odf='p4 opened -c default | p4f'
alias p4s='p4 sync && p4 resolve'
alias p4a='p4 add'
alias p4e='p4 edit'
alias p4r='p4 revert'
alias p4d='p4 diff'
alias p4c='p4 changelists -u $USER -s pending | less'
alias p4n='p4 changelists | cut -f6 -d" " | cut -f1 -d"@" | sort | uniq -c | sort -n'
alias p4m='for file in `p4of`; do test ! -e $file && p4o | grep $file# | grep -v delete >/dev/null && echo $file; done'

function p4ot() { echo; for c in $(p4 changes -s pending -c $(cat .p4config | cut -d= -f2) | cut -d' ' -f2); do p4 change -o $c | grep -C1 "Description:$" | sed "1,2d" | sed "s/\t/[$c] /"; p4o -c $c |     p4f | sed "s/\.\//    /"; echo; done; default=$(p4o -c default 2>/dev/null | p4f | sed "s/\.\//    /"); if [ $default ]; then echo '[default]'; echo $default; echo; fi; }

function p4ocf() { p4 opened -c $1 | p4f }

function watchbt(){
  C=~/p4/current/
  echo "Watching $C...";
  fswatch $C "echo -n 'Updating at ';
  date +"%r";
  rsync -riq --update $C pg1:p4/current;
  echo Updated."
}

