export HADOOP="~/hadoop/hadoop-0.20.2/"
alias hformat="$HADOOP/bin/hadoop namenode"
alias hstart="$HADOOP/bin/start-all.sh && $HADOOP/bin/hadoop dfsadmin -safemode leave"
alias hstop="$HADOOP/bin/stop-all.sh"
alias hput="$HADOOP/bin/hadoop fs -put"
alias hls="$HADOOP/bin/hadoop fs -ls"
alias hadoop="$HADOOP/bin/hadoop"

