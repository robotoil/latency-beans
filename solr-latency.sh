#!/bin/bash
# 
# Query the DSE Search latency beans
# Greg Smith

if [ $# -lt 3 ]
then
  echo "$0 <core> <stage> <query>"
  echo "core: keyspace.table_name"
  echo "stage: COORDINATE, EXECUTE, RETRIEVE"
  echo "query: named query or 'null' for all queries"
  exit
fi
core=$1
stage=$2
query=$3
jmxterm=~/tools/jmxterm-1.0.jar

java -jar $jmxterm <<EOF
option -v SILENT
open localhost:7199
domain com.datastax.bdp
bean com.datastax.bdp:index=${core},name=QueryMetrics,type=search
run getLatencyPercentile $stage $query 50
run getLatencyPercentile $stage $query 90
run getLatencyPercentile $stage $query 99
run getLatencyPercentile $stage $query 99.9
run getLatencyPercentile $stage $query 100
exit

EOF

