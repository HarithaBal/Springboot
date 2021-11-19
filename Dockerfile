FROM openjdk:11
ADD target/my-app-1.0-SNAPSHOT.jar springboot.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","springboot.jar"]

