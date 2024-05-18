Feature: Get an airline

  Scenario: Get an airline with valid data
    Given url 'https://freetestapi.com/api/v1/airlines'
    When method get
    Then status 200