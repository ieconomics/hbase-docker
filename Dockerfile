FROM ieconomics/ubuntu-docker
MAINTAINER antonio@tradingeconomics.com

# install hbase
RUN mkdir /opt/hbase && \ 
    curl http://apache.org/dist/hbase/0.98.14/hbase-0.98.14-hadoop2-bin.tar.gz | tar xz && \
    mv hbase-0.98.14-hadoop2/* /opt/hbase

# Add HBASE to path
ENV PATH /opt/hbase/bin:$PATH
