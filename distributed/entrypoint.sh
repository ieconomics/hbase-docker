#!/bin/bash


echo 'RUNNING ENTRYPOINT'

ZK=${ZK:localhost}
echo 'SETTING ZOOKEEPER TO'
echo $ZK
sed "s/ZK/$ZK/" hbase-site-template.xml > /opt/hbase/conf/hbase-site.xml
cat /opt/hbase/conf/hbase-site.xml

set -e

exec "$@"
