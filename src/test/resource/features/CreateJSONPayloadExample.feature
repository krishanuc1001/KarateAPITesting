Feature: Create nested complex JSON payload using Karate using Set multiple

  Scenario: Create simple JSON object
    * set jsonObjectPayload
      | path | value  |
      | id   | 12     |
      | name | 'John' |
    * print jsonObjectPayload

  Scenario: Create nested JSON object
    * set jsonObjectPayload
      | path           | value         |
      | id             | 12            |
      | name           | 'John'        |
      | address.street | '123 Main St' |
      | address.city   | 'New York'    |
    * print jsonObjectPayload

  Scenario: Create nested JSON object with arrays
    * set jsonObjectPayload
      | path                        | value           |
      | id                          | 12              |
      | name                        | 'John'          |
      | address[0].primary.street   | '123 Main St'   |
      | address[0].primary.city     | 'New York'      |
      | address[1].secondary.street | '10 Downing St' |
      | address[1].secondary.city   | 'London'        |
    * print jsonObjectPayload

  Scenario: Create simple JSON object with variables
    * def idVal = 12
    * def nameVal = 'John'
    * set jsonObjectPayload
      | path | value   |
      | id   | idVal   |
      | name | nameVal |
    * print jsonObjectPayload

  Scenario: Create simple JSON Array object
    * set jsonObjectPayload
      | path | 0      | 1      |
      | id   | 12     | 13     |
      | name | 'John' | 'Jack' |
    * print jsonObjectPayload

  Scenario: Manipulate existing JSON object
    * def existingJsonObject = { id: 17, name: 'John' }
    * set existingJsonObject
      | path | value   |
      | id   | 12      |
      | name | 'Krish' |
    * print existingJsonObject

  Scenario: Manipulate existing JSON object
    * def existingJsonObject = { id: 17, name: 'John' }
    * set existingJsonObject.details
      | path | value   |
      | id   | 12      |
      | name | 'Krish' |
    * print existingJsonObject

  Scenario: Manipulate JSON from json file
    * def existingJsonObject = read('classpath:payloads/createBookingPayload.json')
    * set existingJsonObject.details
      | path | value   |
      | name | 'Krish' |
      | job  | "coder" |
    * print existingJsonObject