#Install and setup Kafka (Ubuntu)


#Follow,

	 sudo apt-get install default-jre
	 sudo apt-get install zookeeperd
	 mkdir -p ~/Downloads
	 wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"
	 tar -xvzf ~/Downloads/kafka_2.11-0.8.2.1.tgz --strip 1

#Configure, Check for broker id, and port 9091

	nano /kafka/config/server.properties


#Copy server.properties to server2.properties and change broker id to 2 and port to 9093 (You can have more brokers , for it do the same process)

	nano /kafka/config/server2.properties

#Start kafka, Exit as running in background, move to kafka folder,


	bin/kafka-server-start.sh config/server.properties > ~/kafka/kafka.log  &

#To start second broker, run start script with its server.properties file and exit to background

	bin/kafka-server-start.sh config/server2.properties > ~/kafka/kafka2.log &

#Produce Hello world message, you can produce it to multiple brokers, specify ports for each while producing messages


	echo "Hello, World" | bin/kafka-console-producer.sh --broker-list localhost:9092,localhost:9093 --topic helloworld > /dev/null


#Listen from consumer, from another terminal

	bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic helloworld --from-beginning

	
#Install perl with modules, 
	
	sudo apt-get install perl
	brew install cpanm
	sudo apt-get install build-essential
	sudo apt-get install libproc-processtable-perl


#Run following script with command to get 'ps aux' command output into JSON format, along with a timestamp and produce it to brokers.

	./ps_into_json.sh && cat ps_aux.JSON | bin/kafka-console-producer.sh --broker-list localhost:9092,localhost:9093 --sync --topic server_machine > /dev/null


#Consume the same messages from another terminal,


	bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic server_machine --from-beginning



#Contain this setup to a Docker,


#Dockerfile,

FROM ubuntu:14.04

MAINTAINER vineethvijayan@qburst.com


RUN sudo apt-get update -y
    && sudo apt-get install default-jre -y
    && sudo apt-get install zookeeperd -y
    && sudo apt-get install wget -y
    && sudo apt-get install perl -y
    && sudo apt-get install cpanminus -y
    && sudo apt-get install build-essential -y
    && sudo apt-get install libproc-processtable-perl -y


RUN wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"

RUN tar xvzf kafka_2.11-0.8.2.1.tgz


RUN cd kafka_2.11-0.8.2.1/

RUN /etc/init.d/zookeeper start


EXPOSE 2181 9092 2888 3888 


