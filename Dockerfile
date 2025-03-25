FROM maven:eclipse-temurin:11-jdk-alpine
WORKDIR /app
COPY src .
COPY pom.xml .
RUN mvn package -DskipTests

FROM maven:eclipse-temurin:11-jdk-alpine
WORKDIR /app
COPY --from=builder /app/target/*jar app.jar
ENTRYPOINT ["java", "-jar"]
CMD ["app.jar"]
