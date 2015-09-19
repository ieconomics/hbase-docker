# Start HBASE
/opt/hbase/bin/start-hbase.sh

# Create OpenTSDB Tables 
export HBASE_HOME=/opt/hbase
export COMPRESSION=NONE
curl -s https://raw.githubusercontent.com/OpenTSDB/opentsdb/master/src/create_table.sh | bash

/bin/sh -c "while true; do echo 'HBASE RUNNING'; /bin/date; sleep 1; done" 
