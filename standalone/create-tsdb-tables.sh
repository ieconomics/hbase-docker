#!/bin/bash 
echo 'CREATING TABLES'
export HBASE_HOME=/opt/hbase
export COMPRESSION=NONE
if [ ! -e /data/opentsdb_tables_created.txt ]; then
	curl -s https://raw.githubusercontent.com/OpenTSDB/opentsdb/master/src/create_table.sh | bash
	echo 'Mark TSDB Tables as Created'
	touch /data/opentsdb_tables_created.txt
fi

