## Introduction

This is a simple script to gather latency metrics produced by DSE [Query Metrics MBean]( http://docs.datastax.com/en/latest-dse/datastax_enterprise/srch/srchQryMbean.html ). This script uses the [jmxtool](http://wiki.cyclopsgroup.org/jmxterm/) which can be used in environments where the use of the traditional jconsole tool may not be possible.

## Instructions

1. clone this repo
```
 git clone https://github.com/gregory-smith/latency-beans.git
```

2. Download [jmxterm](http://wiki.cyclopsgroup.org/jmxterm/)

3. Follow the instructions [here]( http://docs.datastax.com/en/latest-dse/datastax_enterprise/srch/srchQryMbean.html) to create a named Solr query

4. Execute the script solr-latency.sh to gather metrics
e.g For a query named 'query1' in the Solr core 'keyspace1.wiki' 
```
./solr-latency.sh keyspace1.wiki EXECUTE query1
```
