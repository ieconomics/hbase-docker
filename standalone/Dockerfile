FROM ieconomics/hbase-docker
MAINTAINER antonio@tradingeconomics.com

ADD hbase-site.xml /opt/hbase/conf/hbase-site.xml

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

# Add HBASE to path
ENV PATH /opt/hbase/bin:$PATH

VOLUME /data

ADD start.sh start.sh
RUN chmod +x start.sh

ADD supervisord.conf /etc/supervisord.conf

# TSDB TABLES
ADD create-tsdb-tables.sh create-tsdb-tables.sh
RUN chmod +x create-tsdb-tables.sh

# STARTING COMMAND
# CMD ["/bin/sh", "start.sh"]
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
