FROM maven:3.5-alpine as builder

WORKDIR /app
COPY app .
RUN mvn package

#jb-hello-world-maven-0.2.0.jar
#original-jb-hello-world-maven-0.2.0.jar

# # #EL ULTIMO FROM ES EL PADRE DE TODOS
RUN echo "======JDK============"
FROM openjdk:8-alpine
COPY --from=builder /app/target/jb-hello-world-maven-0.2.0.jar /opt/app.jar
CMD java -jar /opt/app.jar