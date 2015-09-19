echo 'Starting HBASE'
/opt/hbase/bin/start-hbase.sh

echo 'Waiting a bit for HBASE before creating TSDB Tables'
sleep 10

echo 'Begun creating TSDB tables'
export HBASE_HOME=/opt/hbase
export COMPRESSION=NONE
curl -s https://raw.githubusercontent.com/OpenTSDB/opentsdb/master/src/create_table.sh | bash

echo 'Leave a loop scrip running'
/bin/sh -c "while true; do echo 'HBASE RUNNING'; /bin/date; sleep 1; done" 
