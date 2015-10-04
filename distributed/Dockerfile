FROM ieconomics/ubuntu-docker
MAINTAINER antonio@tradingeconomics.com

# install hbase
RUN mkdir /opt/hbase && \ 
    curl http://apache.org/dist/hbase/0.98.14/hbase-0.98.14-hadoop2-bin.tar.gz | tar xz && \
    mv hbase-0.98.14-hadoop2/* /opt/hbase

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

#HBASE CONFIG FILES
ADD hbase-site-template.xml hbase-site-template.xml
ADD hbase-site-template.sh hbase-site-template.sh
RUN chmod a+ hbase-site-template.sh

RUN .\hbase-site-template.sh
