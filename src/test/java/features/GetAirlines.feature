Feature: Airline information

  Scenario: Get all airline data
    Given url 'https://freetestapi.com/api/v1/airlines'
    When method get
    Then status 200

  Scenario: Get an airline info for 5 airlines
    Given url 'https://freetestapi.com/api/'
    And path "v1/airlines"
    And param limit = 5
    When method get
    Then status 200
    And print "response status: " + responseStatus
    And match response == [{"id":1,"name":"Lufthansa","code":"LH","country":"Germany","founded":"1953","fleet_size":"300+","headquarters":"Cologne, Germany","website":"https://www.lufthansa.com/","destinations":[{"name":"New York","code":"JFK"},{"name":"London","code":"LHR"},{"name":"Paris","code":"CDG"}]},{"id":2,"name":"Emirates","code":"EK","country":"United Arab Emirates","founded":"1985","fleet_size":"250+","headquarters":"Dubai, UAE","website":"https://www.emirates.com/","destinations":[{"name":"Dubai","code":"DXB"},{"name":"New York","code":"JFK"},{"name":"London","code":"LHR"}]},{"id":3,"name":"American Airlines","code":"AA","country":"United States","founded":"1930","fleet_size":"800+","headquarters":"Fort Worth, Texas, USA","website":"https://www.aa.com/","destinations":[{"name":"Los Angeles","code":"LAX"},{"name":"Chicago","code":"ORD"},{"name":"Miami","code":"MIA"}]},{"id":4,"name":"British Airways","code":"BA","country":"United Kingdom","founded":"1974","fleet_size":"280+","headquarters":"London, UK","website":"https://www.britishairways.com/","destinations":[{"name":"London","code":"LHR"},{"name":"New York","code":"JFK"},{"name":"Hong Kong","code":"HKG"}]},{"id":5,"name":"Air France","code":"AF","country":"France","founded":"1933","fleet_size":"220+","headquarters":"Roissy-en-France, France","website":"https://www.airfrance.com/","destinations":[{"name":"Paris","code":"CDG"},{"name":"New York","code":"JFK"},{"name":"Tokyo","code":"NRT"}]}]
    And match response[1].name == "Emirates"
    And print responseHeaders["Content-Type"]
    And match header Content-Type == "application/json"
    And match header Content-Type contains "application/json"
