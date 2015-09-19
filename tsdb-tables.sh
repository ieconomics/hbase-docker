
echo 'CREATE TSDB TABLES'

echo 'MAKE A PAUSE TO ALLOW HBASE TO START'
sleep 10

echo 'CREATING TABLES'
export HBASE_HOME=/opt/hbase
export COMPRESSION=NONE
curl -s https://raw.githubusercontent.com/OpenTSDB/opentsdb/master/src/create_table.sh | bash
