# My Spring Boot Application

A containerized Spring Boot REST application configured with automated CI/CD using GitHub Actions and GitHub Container Registry (GHCR).

## Tech Stack

- **Language:** Java 25
- **Framework:** Spring Boot 3.x
- **Build Tool:** Apache Maven
- **Containerization:** Docker
- **CI/CD:** GitHub Actions
- **Container Registry:** GitHub Container Registry (GHCR)

---

## Local Development & Testing

### Prerequisites
- JDK 25
- Maven Wrapper (\./mvnw\)
- Docker Desktop

### 1. Build and Run Tests Locally
\\\powershell
./mvnw clean test
./mvnw spring-boot:run
\\\

---

## Pulling & Running the Container from GHCR

The GitHub Actions workflow automatically builds, tests, and publishes the container image to GHCR upon every push to \main\.

### 1. Authenticate with GHCR
Authenticate your local Docker engine using a Personal Access Token (PAT) with \ead:packages\ scope:

\\\powershell
echo YOUR_GITHUB_PAT | docker login ghcr.io -u Ganishguru --password-stdin
\\\

### 2. Pull and Run the Container
\\\powershell
# Pull the latest image from GHCR
docker pull ghcr.io/ganishguru/my-springboot-app:latest

# Run container on port 8080
docker run -d -p 8080:8080 --name my-springboot-app-container ghcr.io/ganishguru/my-springboot-app:latest
\\\

### 3. Verify Application Health
\\\powershell
curl http://localhost:8080
\\\
**Expected Response:** \Hello from Spring Boot!\

---

## CI/CD Pipeline Workflow

The repository includes an automated workflow defined in \.github/workflows/ci-cd.yml\ that performs:
1. **Checkout Code**: Retrieves the repository source.
2. **Setup JDK**: Configures Java 25 environment with Maven caching.
3. **Run Tests**: Executes Maven test suites.
4. **Build & Push Docker Image**: Multi-stage build pushing tagged images (\:latest\ and Git commit SHA) directly to GHCR.
