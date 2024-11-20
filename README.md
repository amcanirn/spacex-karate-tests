# SpaceX GraphQL API Karate Testing

This repository demonstrates how to use [Karate](https://github.com/karatelabs/karate) for testing the SpaceX GraphQL API. It includes examples of functional API testing, integration with Gatling for performance testing, and is built with Maven for streamlined setup and execution.

---

## Features

- **Karate Testing**: Declarative, easy-to-read test scripts for the SpaceX GraphQL API.
- **GraphQL Query Validation**: Covers testing GraphQL queries and mutations with dynamic payloads.
- **Performance Testing**: Seamless integration with Gatling for API performance evaluation.
- **Modular Structure**: Organized for easy addition of new query types or feature categories.
- **Maven Build**: Simplified project setup, dependency management, and execution.
- **GitHub Actions**: Automated CI/CD pipeline for running tests and ensuring code quality.

---

## Prerequisites

Ensure the following are installed:

- [Java 17](https://www.java.com/)
- [Maven](https://maven.apache.org/)

---

## Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/amcanirn/spacex-karate-tests.git
   cd spacex-karate-tests
   ```

2. **Run all tests**:
   ```bash
   mvn clean test
   ```

3. **Run a specific test** (e.g., `RocketRunner`):
   ```bash
   mvn clean test -Dtest=RocketRunner
   ```

4. **Run performance tests**:
   ```bash
   mvn clean test -P performance
   ```

5. **Run with specific thread count**:
   ```bash
   mvn clean test -DTHREADS=2
   ```

---

## Project Structure

```
spacex-karate-tests/
│   .gitignore
│   karate.jar
│   pom.xml
│   README.md
│
├───.github     # Pipeline execution
│
└───src
    └───test
        ├───java
        │   │   karate-config.js    # Environment setup for tests
        │   │   logback-test.xml    # Logging configuration
        │   │
        │   ├───performance   # Performance test simulations
        │   │
        │   └───queries       # Karate tests
        │
        └───resources
            ├───data    # Data files for testing
            │
            └───lib     # Custom utility scripts
```

---

## Resources

- [Karate Documentation](https://github.com/karatelabs/karate)
- [SpaceX GraphQL API](https://api.spacex.land/graphql/)
- [Gatling Documentation](https://gatling.io/docs/)
- [Learn GraphQL](https://graphql.org/learn/)

---

### Notes for Expansion

- **Adding New Queries**: Add new `.feature` files and runners in the `queries/` subdirectory with appropriate folder structures.
- **Reusable Data**: Place JSON or text files in `resources/data/` for test reusability.
- **Performance Testing**: Add scenarios to `GatlingSimulation.java` or create new simulations under the `performance/` directory.