#!/bin/sh

nohup /context/zookeeper/bin/zkServer.sh start &
nohup /context/kafka/bin/kafka-server-start.sh /context/kafka/config/server.properties &
nohup java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /context/eureka.jar &
sleep 40
nohup java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /context/gitlab-config.jar &
sleep 60
nohup java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /context/hystrix-dashboard.jar &
nohup java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /context/turbine.jar &
nohup java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /service/test-service.jar &
nohup java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /service/example-service.jar &
nohup java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /context/zipkin.jar &
nohup java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /context/zuul.jar
