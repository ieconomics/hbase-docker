#!/bin/bash

echo 'STARTING OPENTSDB'
echo 'OPENTSDB ZK SET TO' $HBASE_ZK
echo 'WAIT A BIT FOR HBASE TO WARMUP'

sleep 30

echo 'check if tables were created'
if [ ! -e /opt/opentsdb_tables_created.txt ]; then
	echo "creating tsdb tables"
	bash create-tsdb-tables.sh
	echo "created tsdb tables"
fi


echo 'LAUNCHING OPENTSDB'
/usr/share/opentsdb/bin/tsdb tsd --zkquorum=localhost:2181 --auto-metric

