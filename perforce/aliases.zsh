function watchbt(){
  C=~/p4/current/
  echo "Watching $C...";
  fswatch $C "echo -n 'Updating at ';
  date +"%r";
  rsync -riq --update $C pg1:p4/current;
  echo Updated."
}
