# SpaceX GraphQL API Karate Testing

This repository demonstrates how to use [Karate](https://github.com/karatelabs/karate) for testing the SpaceX GraphQL API. It includes examples of API testing and integrates with Gatling for performance testing. The project is built with Maven for ease of setup and execution.

## Features

- **Karate**: Test the SpaceX GraphQL API with declarative, easy-to-read test scripts.
- **GraphQL Support**: Demonstrates GraphQL query testing.
- **Gatling Java Integration**: Performance testing with Karate and Gatling.
- **Maven**: Easily build and manage dependencies.

## Prerequisites

Ensure the following are installed on your system:

- [Java 17](https://www.java.com/)
- [Maven](https://maven.apache.org/)

## Getting Started

1. Clone the repository:performance
   ```bash
   git clone https://github.com/amcanirn/spacex-karate-tests.git
   cd spacex-karate-tests
   ```

2. Install dependencies, build the project and run the tests:
   ```bash
   mvn clean install
   ```

3. Running tests:
   ```bash
   mvn test
   ```

4. Execute the Gatling tests:
   ```bash
   mvn gatling:test
   ```

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
        └───java
            │   karate-config.js
            │   logback-test.xml
            │
            ├───lib
            │       time-validator.js
            │
            ├───performance
            │       GatlingSimulation.java
            │
            └───queries
                │   QueryTests.java
                │
                └───launch
                        launch.feature
                        LaunchRunner.java
```

### Key Files and Directories

- **`queries/`**: Contains Karate `.feature` files for testing the SpaceX GraphQL API.
- **`performance/`**: Contains Gatling test files for performance testing the SpaceX GraphQL API.
- **`karate-config.js`**: Sets up the environment configuration for Karate tests.
- **`pom.xml`**: Maven configuration file for managing dependencies and build plugins.

## Technologies Used

- **Karate**: Simplifies API and GraphQL testing with BDD-style syntax.
- **Gatling**: Performance testing to measure API scalability.
- **Maven**: Manages dependencies and builds the project.
- **Java**: Primary runtime for Karate and Gatling.

## Resources

- [Karate Documentation](https://github.com/karatelabs/karate)
- [SpaceX GraphQL API](https://api.spacex.land/graphql/)
- [Gatling Documentation](https://gatling.io/docs/)