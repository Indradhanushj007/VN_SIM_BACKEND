# Use official OpenJDK base image
FROM openjdk:17-jdk-slim

# Set working directory inside container
WORKDIR /app

# Copy your JAR file into the container
ADD portal-0.0.1-SNAPSHOT.jar app.jar

# Expose port your Spring Boot app runs on
EXPOSE 8086

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
