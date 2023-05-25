FROM maven as build1
WORKDIR /app
COPY src ./src
COPY ./pom.xml ./pom.xml
RUN mvn package

FROM openjdk:17 as build2
COPY --from=build1 ./app/target/*.jar /opt/petclinic.jar
ENTRYPOINT ["java", "-jar", "/opt/petclinic.jar"]
