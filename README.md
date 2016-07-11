Install Kafka ( ubuntu)


Follow,

	 sudo apt-get install default-jre
	 sudo apt-get install zookeeperd
	 mkdir -p ~/Downloads
	 wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"
	 tar -xvzf ~/Downloads/kafka.tgz --strip 1

#Configure

	nano ~/kafka/config/server.properties

#Start kafka,
#Exit as running in background


	nohup ~/kafka/bin/kafka-server-start.sh ~/kafka/config/server.properties > ~/kafka/kafka.log 2>&1 &

#Produce "hello world" message

	echo "Hello, World" | ~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic TutorialTopic > /dev/null

#Listen from consumer, from another terminal

	~/kafka/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic TutorialTopic --from-beginning

	

#Install perl with modules, 
	
	sudo apt-get install perl
	brew install cpanm
	sudo apt-get install build-essential
	sudo apt-get install libproc-processtable-perl

#Run following script and command to get 'ps aux' command output into JSON format along with timestamp!

	./ps_into_JSON.sh && cat ps.JSON | ~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic TutorialTopic > /dev/null
