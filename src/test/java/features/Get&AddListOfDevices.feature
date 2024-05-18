Feature: List of devices

  Scenario: Get device list
    Given url 'https://api.restful-api.dev/objects'
    When method GET
    Then status 200


  Scenario: Add device list
    Given url 'https://api.restful-api.dev/objects'
    When method POST
    And request { "name": "Apple MacBook Pro 16", "data": { "year": 2019, "price": 1849.99, "CPU model": "Intel Core i9", "Hard disk size": "1 TB" } }
    Then status 201

