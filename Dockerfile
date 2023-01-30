FROM openjdk:8
EXPOSE 8085
ADD target/devops-auto.jar devops-auto.jar
ENTRYPOINT ["java","-jar","/devops-auto.jar"]