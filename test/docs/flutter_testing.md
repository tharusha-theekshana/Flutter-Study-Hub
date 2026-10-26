# **Introduction to Testing**

This section covers testing in Flutter to ensure application quality, reliability, and maintainability. It includes unit testing, widget testing, and integration testing, with practical examples to understand how to write, execute, and maintain effective tests.

Topics Covered:
* Unit Test
* API Ting
* Firebase Test


## Unit Test
Unit testing is a way to test small parts of an application, such as functions and methods, to make sure they work correctly.

In Flutter, unit tests help verify that the code produces the expected results and identify errors early in development.

This section covers the basics of unit testing, including writing simple tests, checking expected results using **expect()**, and running tests using the **flutter_test** package.

## API Test
API testing checks whether application communicates with a backend correctly. You send an HTTP request and verify the response, status code, returned data, and error handling.

**What is mocking?**

Mocking means replacing a real dependency with a controlled fake version during testing.

Packages for API testing -
* **http -** Sends HTTP requests.
* **mocktail -** Mocking library. It supports creating mock and fake dependencies without generating mock files.
* **mockito -** Creates mock objects to simulate dependencies, such as repositories, services, or API clients.

## Firebase Test