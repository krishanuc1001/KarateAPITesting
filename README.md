# Karate API Testing Project

This project is designed to demonstrate API testing using the Karate framework. It includes examples of how to set up and execute API tests using Karate, along with integration for Kafka messaging.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Java 17
- Maven

### Installing

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Use Maven to install the project dependencies:

```zsh
mvn install
```

## Running the tests

To run the tests, execute the following command when using `karate-core` dependency:

```zsh
mvn clean test-compile exec:java -Dexec.mainClass=runner.RunnerTest
```

To run the tests, execute the following command when using `karate-junit5` dependency with maven-surefire-plugin:

```zsh
mvn clean test
```

To run the tests on an environment, say `dev` (configured in `karate.-config.js` file), execute the following command:

```zsh
mvn clean test -Dkarate.env=dev
```


This will execute all the tests in the `src/test/java/features` directory.


Built With
Karate - The main framework used for API testing.
Maven - Build tool and dependency management.