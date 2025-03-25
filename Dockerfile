FROM  maven:3.9.9-eclipse-temurin-23-alpine AS builder
WORKDIR /app
COPY src .
COPY pom.xml .
RUN mvn package -DskipTests

FROM maven:3.9.9-eclipse-temurin-23-alpine
WORKDIR /app
COPY --from=builder ./target/*.jar app.jar
ENTRYPOINT ["java", "-jar"]
CMD ["app.jar"]
