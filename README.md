docker build -t ieconomics/hbase-docker:latest .

docker run -d --name hbase-data -v /data:/data ieconomics/hbase-docker:latest /bin/true

docker run -d -h hbase --name hbase -p 2181:2181 -p 60000:60000 -p 60010:60010 -p 60020:60020 -p 60030:60030 --volumes-from hbase-data ieconomics/hbase-docker:latest

docker exec -i -t hbase /bin/bash

