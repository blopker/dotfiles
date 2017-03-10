if (($ISOSX)); then
  alias flush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
fi
