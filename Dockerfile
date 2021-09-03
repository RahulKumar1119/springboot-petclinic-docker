FROM openjdk:8-jdk-alpine

RUN mkdir /logs

COPY target/spring-petclinic-2.5.0-SNAPSHOT.jar spring-petclinic-2.5.0-SNAPSHOT.jar

EXPOSE 8086

ENTRYPOINT ["java","-Dlogging.file.name=/logs/spring-petclinc.log","-jar","./spring-petclinic-2.5.0-SNAPSHOT.jar"]
