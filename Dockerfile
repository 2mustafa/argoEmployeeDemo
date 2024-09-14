# Use a Maven-based image to build the application
FROM maven:3.8.5-openjdk-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project to the container
COPY . .

# Build the application using Maven
RUN mvn clean package -DskipTests

# Use a lightweight OpenJDK image to run the Spring Boot app
FROM openjdk:17-jdk-slim

# Set environment variable for the JAR file
ENV JAR_FILE=thymeleafdemo-0.0.1-SNAPSHOT.jar

# Copy the application JAR file from the Maven container
COPY --from=build /app/target/${JAR_FILE} /app/${JAR_FILE}

# Set the entry point for the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app/thymeleafdemo-0.0.1-SNAPSHOT.jar"]
