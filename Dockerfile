## hbase standalone
FROM ubuntu
MAINTAINER antonio@tradingeconomics.com

# install requirements
ENV DEBIAN_FRONTEND noninteractive
RUN \
  apt-get update && \
  apt-get install -y python-software-properties software-properties-common curl

# install java
RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer

# install hbase
RUN mkdir /opt/hbase && \ 
    curl http://apache.org/dist/hbase/hbase-0.98.9/hbase-0.98.9-hadoop2-bin.tar.gz | tar xz && \
    mv hbase-0.98.9-hadoop2/* /opt/hbase

# ADD hbase-site.xml /etc/hbase/conf/hbase-site.xml

# need this for hbase to run
ENV JAVA_HOME /usr

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

COPY start.sh start.sh
CMD ["/bin/bash", "start.sh"]


# Launch HBASE on Container Start
# CMD ["hbase", "master", "start"]
# CMD ["/opt/hbase/bin/hbase", "master", "start"]
# CMD ["/bin/sh", "/opt/hbase/bin/start-hbase.sh"]

