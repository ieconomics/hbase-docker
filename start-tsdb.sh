#!/bin/bash
echo 'STARTING OPENTSDB'
echo 'WAIT A BIT FOR HBASE TO WARMUP'
sleep 20

echo 'CREATING TABLES ONLY IF NEEDED'
bash create-tsdb-tables.sh

echo 'LAUNCHING OPENTSDB'
/usr/share/opentsdb/bin/tsdb tsd --zkquorum=localhost:2181 --auto-metric

