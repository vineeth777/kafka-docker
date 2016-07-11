Install Kafka ( ubuntu)


Follow,

	 sudo apt-get install default-jre
	 sudo apt-get install zookeeperd
	 mkdir -p ~/Downloads
	 wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"
	 tar -xvzf ~/Downloads/kafka_2.11-0.8.2.1.tgz --strip 1

#Configure

	nano ~/kafka/config/server.properties

#Check for broker id, and port 9091

#Copy server.properties to server2.properties and change broker id to 2 and port to 9093 (You can have more brokers , for it do the same process)


#Start kafka, Exit as running in background, move to kafka folder,


	nohup bin/kafka-server-start.sh config/server.properties > ~/kafka/kafka.log 2>&1 &

#To start second broker, run start script with its server.properties file and exit to background

	bin/kafka-server-start.sh config/server2.properties > ~/kafka/kafka2.log &

#Produce Hello wolrd message, you can produce it to multiple brokers, specify ports for each while producing messages


	echo "Hello, World" | bin/kafka-console-producer.sh --broker-list localhost:9092,localhost:9093 --topic helloworld > /dev/null


#Listen from consumer, from another terminal

	bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic helloworld --from-beginning

	

#Install perl with modules, 
	
	sudo apt-get install perl
	brew install cpanm
	sudo apt-get install build-essential
	sudo apt-get install libproc-processtable-perl


#Run following script with command to get 'ps aux' command output into JSON format, along side along with a timestamp and produce it to brokers.

	./ps_into_json.sh && cat ps_aux.JSON | bin/kafka-console-producer.sh --broker-list localhost:9092,localhost:9093 --sync --topic server_machine > /dev/null



#Consume the same messages from another terminal,


	bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic server_machine --from-beginning
