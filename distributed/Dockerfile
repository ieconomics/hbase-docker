FROM ieconomics/hbase-docker
MAINTAINER antonio@tradingeconomics.com

# zookeeper
EXPOSE 2181
# HBase Master API port
EXPOSE 60000
# HBase Master Web UI
EXPOSE 60010
# Regionserver API port
EXPOSE 60020
# HBase Regionserver web UI
EXPOSE 60030

VOLUME /data

#HBASE CONFIG FILES

ADD hbase-site-template.xml hbase-site-template.xml

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
