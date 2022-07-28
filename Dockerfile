FROM maven:3.8.6-jdk-11-slim as build
COPY kotlin-spring-realworld-example-app /home/kotlin-spring-realworld-example-app
RUN mvn -f /home/kotlin-spring-realworld-example-app/pom.xml clean package

FROM openjdk:11-jre-slim as serve
COPY --from=build /home/kotlin-spring-realworld-example-app/target/api-0.0.1-SNAPSHOT.jar /usr/local/lib/api.jar
CMD ["java","-jar","/usr/local/lib/api.jar"]

# Test
