# Start HBASE
/opt/hbase/bin/start-hbase.sh

# Wait a few seconds before installing TSDB tables
echo 'Wait a bit for HBASE to start before installing TSDB Tables'
sleep 10

# Create OpenTSDB Tables 
export HBASE_HOME=/opt/hbase
export COMPRESSION=NONE
curl -s https://raw.githubusercontent.com/OpenTSDB/opentsdb/master/src/create_table.sh | bash

# Leave a scrip running
/bin/sh -c "while true; do echo 'HBASE RUNNING'; /bin/date; sleep 1; done" 
