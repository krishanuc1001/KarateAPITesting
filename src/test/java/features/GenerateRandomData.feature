Feature: Generate random data using Java faker library

  Scenario: Create new user with JSON payload and data faker library
    * def dataFaker = Java.type('net.datafaker.Faker')
    * def dataFakerObj = new dataFaker()
    * def nameValue = dataFakerObj.name().fullName()
    * def jobValue = dataFakerObj.job().title()
    * set jsonObjectPayload
      | path | value     |
      | name | nameValue |
      | job  | jobValue  |
    * print jsonObjectPayload

  Scenario: Create new user with JSON payload and data faker library using Custom Java class
    * def dataFaker = Java.type('utils.RandomDataGenerator')
    * def nameValue = dataFaker.getRandomName()
    * def jobValue = dataFaker.getRandomJobTitle()
    * set jsonObjectPayload
      | path | value     |
      | name | nameValue |
      | job  | jobValue  |
    * print jsonObjectPayload