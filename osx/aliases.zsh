if (($ISMACOS)); then
  alias flush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
fi
