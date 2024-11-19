# SpaceX GraphQL API Karate Testing

This repository demonstrates how to use [Karate](https://github.com/karatelabs/karate) for testing the SpaceX GraphQL API. It includes examples of functional API testing, integration with Gatling for performance testing, and is built with Maven for streamlined setup and execution.

---

## Features

- **Karate Testing**: Declarative, easy-to-read test scripts for the SpaceX GraphQL API.
- **GraphQL Query Validation**: Covers testing GraphQL queries and mutations with dynamic payloads.
- **Performance Testing**: Seamless integration with Gatling for API performance evaluation.
- **Modular Structure**: Organized for easy addition of new query types or feature categories.
- **Maven Build**: Simplified project setup, dependency management, and execution.

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

---

## Project Structure

```
spacex-karate-tests/
│   .gitignore
│   karate.jar
│   pom.xml
│   README.md
│
└───src
    └───test
        ├───java
        │   │   karate-config.js    # Environment setup for tests
        │   │   logback-test.xml    # Logging configuration
        │   │
        │   ├───performance         # Performance test simulations
        │   │       GatlingSimulation.java
        │   │
        │   └───queries
        │       │   QueryTests.java
        │       │
        │       ├───launch           # Tests related to launch queries
        │       │       launch.feature
        │       │       LaunchRunner.java
        │       │
        │       └───rocket          # Tests related to rocket queries
        │               rocket.feature
        │               RocketRunner.java
        │
        └───resources
            ├───data                # Data file for testing
            │       rockets.txt
            │
            └───lib                 # Custom utility scripts
                    time-validator.js
```

---

### Key Files and Directories

- **`queries/`**:
  - Houses all GraphQL query tests.
  - Subdirectories like `launch/` and `rocket/` group tests by functionality.

- **`resources/data/`**:
  - Contains reusable data files (e.g., `rockets.txt`) for dynamic testing.

- **`performance/`**:
  - Contains Gatling scripts for API performance tests.

- **`karate-config.js`**:
  - Configures environments (e.g., dev, test, prod) for Karate tests.

- **`pom.xml`**:
  - Maven configuration file for dependency management and build execution.

---

## Technologies Used

- **Karate**: Simplifies API and GraphQL testing with a BDD-style syntax.
- **Gatling**: Performance testing to measure scalability and response times.
- **Maven**: For dependency management and automated builds.
- **Java**: Runtime for Karate and Gatling.

---

## Resources

- [Karate Documentation](https://github.com/karatelabs/karate)
- [SpaceX GraphQL API](https://api.spacex.land/graphql/)
- [Gatling Documentation](https://gatling.io/docs/)

---

### Notes for Expansion

- **Adding New Queries**: Add new `.feature` files and runners in the `queries/` subdirectory with appropriate folder structures.
- **Reusable Data**: Place JSON or text files in `resources/data/` for test reusability.
- **Performance Testing**: Add scenarios to `GatlingSimulation.java` or create new simulations under the `performance/` directory.