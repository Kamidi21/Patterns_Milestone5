FROM eclipse-temurin:17-alpine as build
WORKDIR /app
COPY . .
RUN mvn clean package -Pprod -DskipTests

FROM eclipse-temurin:17-alpine
COPY --from=build /app/target/DogManagementSystem-0.0.1-SNAPSHOT.jar /app/DogManagementSystem.jar
EXPOSE 8080
CMD ["java", "-jar", "/app/DogManagementSystem.jar"]

