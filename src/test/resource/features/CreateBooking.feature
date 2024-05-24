Feature: Booking API functionalities

  Background:
    Given url "https://reqres.in/api"

  Scenario: Create new user using hardcoded JSON payload
    And path "/users"
    And request { "name": "morpheus", "job": "leader" }
    When method post
    Then status 201
    And print response
    And print responseStatus


  Scenario: Create new user using hardcoded multiline JSON payload
    And path "/users"
    And request
    """
    {
      "name": "krish",
      "job": "The leader"
    }
    """
    When method post
    Then status 201
    And print response
    And print responseStatus


  Scenario: Create new user using JSON Object payload
    And path "/users"
    * def requestPayload = {}
    * requestPayload.name = "vagabond"
    * requestPayload.job = "roaming around the world"
    And request requestPayload
    When method post
    Then status 201
    And print response
    And print responseStatus


  Scenario: Create new user by reading JSON from file
    And path "/users"
    * def requestPayload = read('classpath:payloads/createBookingPayload.json')
    * print "<<=========== REQUEST PAYLOAD BEFORE ============>>"
    * print requestPayload
    * set requestPayload.name = "John Wick"
    * set requestPayload.job = "Assassin"
    * print "<<=========== REQUEST PAYLOAD AFTER ============>>"
    * print requestPayload
    And request requestPayload
    When method post
    Then status 201
    And match response.name == "John Wick"
    And match response.job == "Assassin"