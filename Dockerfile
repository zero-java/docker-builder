FROM openjdk:8-jdk-alpine
VOLUME /tmp
RUN apk update
RUN apk upgrade
RUN apk add bash
RUN mkdir -p /context /tmp/zookeeper /service
ADD zookeeper-3.3.6 /context/zookeeper
ADD kafka_2.11-0.10.2.0 /context/kafka
# 8000
ADD example-service-1.0-SNAPSHOT.jar /service/example-service.jar
# 8001
ADD test-service-1.0-SNAPSHOT.jar /service/test-service.jar
# 8002
ADD spring-cloud-hystrix-dashboard-1.0-SNAPSHOT.jar /context/hystrix-dashboard.jar
# 8762
ADD spring-cloud-register-eureka-1.0-SNAPSHOT.jar /context/eureka.jar
# 8004
ADD spring-cloud-server-config-1.0-SNAPSHOT.jar /context/gitlab-config.jar
# 8003
ADD spring-cloud-turbine-1.0-SNAPSHOT.jar /context/turbine.jar
# 2000
ADD spring-cloud-zuul-1.0-SNAPSHOT.jar /context/zuul.jar
# 8005
ADD spring_cloud_zipkin-1.0-SNAPSHOT.jar /context/zipkin.jar
ADD start.sh /start.sh
EXPOSE 2000 8762 2181 9092 8000 8002 8004 8003 8005 8001
ENV JAVA_OPTS="-Xms16m -Xmx128m"
ENTRYPOINT ["/start.sh"]