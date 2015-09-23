## hbase standalone
FROM ubuntu
MAINTAINER antonio@tradingeconomics.com

# install requirements
ENV DEBIAN_FRONTEND noninteractive
RUN \
  apt-get update && \
  apt-get install -y python-software-properties software-properties-common curl nano

# install java
RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer

# install hbase
RUN mkdir /opt/hbase && \ 
    curl http://apache.org/dist/hbase/0.98.14/hbase-0.98.14-hadoop2-bin.tar.gz | tar xz && \
    mv hbase-0.98.14-hadoop2/* /opt/hbase

ADD hbase-site.xml /opt/hbase/conf/hbase-site.xml

# INSTALL TSDB
# ADD https://github.com/OpenTSDB/opentsdb/releases/download/v2.1.0RC1/opentsdb-2.1.0RC1_all.deb /tmp/opentsdb.deb
ADD https://github.com/ieconomics/opentsdb/blob/next/opentsdb.deb?raw=true /tmp/opentsdb.deb
RUN dpkg -i /tmp/opentsdb.deb
RUN rm /tmp/opentsdb.deb

# need this for hbase to run
ENV JAVA_HOME /usr

# For nano to work properly
ENV TERM=xterm

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

# TSDB
EXPOSE 4242

# Supervisor
EXPOSE 9001

# Add HBASE to path
ENV PATH /opt/hbase/bin:$PATH

VOLUME /data

ADD start-hbase.sh start-hbase.sh
ADD start-tsdb.sh start-tsdb.sh
ADD create-tsdb-tables.sh create-tsdb-tables.sh

# THIS IS REQUIRED ONLY WHEN WE DO NOT USE CMD
RUN chmod +x start-hbase.sh
RUN chmod +x start-tsdb.sh
RUN chmod +x create-tsdb-tables.sh

CMD ["/bin/sh", "start-hbase.sh"]
CMD ["/bin/sh", "start-tsdb.sh"]

# COPY supervisord.conf /etc/supervisord.conf
# CMD [ "/usr/bin/supervisord" ]
# Launch HBASE on Container Start
# CMD ["hbase", "master", "start"]
# CMD ["/opt/hbase/bin/hbase", "master", "start"]
# CMD ["/bin/sh", "/opt/hbase/bin/start-hbase.sh"]

