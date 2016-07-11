
FROM ubuntu:14.04

MAINTAINER vineethvijayan@qburst.com


RUN sudo apt-get update -y
RUN sudo apt-get install default-jre -y
RUN  sudo apt-get install zookeeperd -y
RUN sudo apt-get install wget -y
RUN sudo apt-get install perl -y
RUN sudo apt-get install cpanminus -y
RUN sudo apt-get install build-essential -y
RUN sudo apt-get install libproc-processtable-perl -y


RUN wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"
RUN tar xvzf kafka_2.11-0.8.2.1.tgz


RUN cd kafka_2.11-0.8.2.1/

RUN /etc/init.d/zookeeper start

#RUN kafka_2.11-0.8.2.1//bin/kafka-server-start.sh kafka_2.11-0.8.2.1/config/server.properties


EXPOSE 2181 9092 2888 3888

