Feature: Booking API functionalities

  Scenario: Create new user using hardcoded JSON payload
    Given url "https://reqres.in/api/users"
    And request { "name": "morpheus", "job": "leader" }
    When method post
    Then status 201
    And print response


  Scenario: Create new user using hardcoded multiline JSON payload
    Given url "https://reqres.in/api/users"
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


  Scenario: Create new user using JSON Object payload
    Given url "https://reqres.in/api/users"
    * def requestPayload = {}
    * requestPayload.name = "vagabond"
    * requestPayload.job = "roaming around the world"
    And request requestPayload
    When method post
    Then status 201
    And print response
    And print responseStatus