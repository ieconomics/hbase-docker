
# Start HBASE Standalone

sudo docker run -d -h hbase --name hbase -p 2181:2181 -p 60000:60000 -p 60010:60010 -p 60020:60020 -p 60030:60030 antoniojfsousa/hbase


# Access the shell

sudo docker exec -i -t hbase bash


# Creating OpenTSDB Tables 

export HBASE_HOME=/opt/hbase

export COMPRESSION=NONE

curl -s https://raw.githubusercontent.com/OpenTSDB/opentsdb/master/src/create_table.sh | bash
