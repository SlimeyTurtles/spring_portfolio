# syntax=docker/dockerfile:1
FROM openjdk:16-alpine3.13
WORKDIR /app
RUN apk update && apk upgrade && \
  apk add --no-cache git maven
RUN git clone https://github.com/nighthawkcoders/spring_portfolio.git /app
RUN ./mvnw package
CMD ["java", "-jar", "target/spring-0.0.1-SNAPSHOT.jar"]
# EXPOSE port that is defined in spring_portfolio.git application.properties
EXPOSE 8085
