# =========================
# Stage 1: Build
# =========================
FROM maven:3.9-eclipse-temurin-21-alpine AS builder

WORKDIR /build

# Copy Maven files first for better Docker layer caching
COPY pom.xml .

RUN mvn dependency:go-offline -B

# Copy application source
COPY /target/gameapp-1.0.0.jar .

# Build the application
RUN mvn clean package -DskipTests


# =========================
# Stage 2: Runtime
# =========================
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Create a non-root user
RUN addgroup -S appgroup && \
    adduser -S appuser -G appgroup

# Copy only the generated JAR
COPY --from=builder /build/target/gameapp-1.0.0.jar app.jar

# Run as non-root
USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]