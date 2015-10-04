#!/bin/bash
ZK=${ZK:localhost}
echo 'SETTING ZOOKEEPER TO'
echo $ZK
sed "s/ZK/$ZK/" hbase-site-template.xml > /opt/hbase/conf/hbase-site.xml
cat /opt/hbase/conf/hbase-site.xml
