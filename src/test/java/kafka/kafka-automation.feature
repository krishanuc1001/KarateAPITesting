Feature: Kafka automation using Karate

  Scenario: Reset Offsets to latest for the consumer groups
    * call read('classpath:reset-offsets-for-consumer-groups.feature')
    * def KafkaConsumer = Java.type('utils.KafkaOffsetConfigReset')
    * def autoConsumerGroup = "autoConsumerGroup"
    * def outgoingTopic = "outgoingTopic"
    * def kcAutoConsumer = new KafkaConsumer(autoConsumerGroup, outgoingTopic)
    * call waitUntil 10000
    * kcAutoConsumer.close()

  Scenario: Produce messages from Service A to Service B
    * call read('classpath:produce-messages-from-serviceA-to-serviceB.feature')

  Scenario: Validate acknowledgement of messages from Service B to Service A
    * call read('classpath:validate-acknowledgement-of-messages-from-serviceB-to-serviceA.feature')
