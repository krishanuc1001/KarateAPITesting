Feature: Karate-kafka demo

Background:
* configure kafka =
"""
{
  'bootstrap.servers': '127.0.0.1:9092'
}
"""

  Scenario:
#  Async Consumer
    * def session  = karate.consume('kafka')
    * session.topic = 'karate-demo-topic'
    * session.groupId = 'karate-demo-group'
    * session.count = 1
    * session.start()

#  Producer DSL
    * topic 'karate-demo-topic'
    * key 'first'
    * value { message: 'Hello there!', info: { first: 1, second: true } }
    * producer kafka

#  Collect and Assert
    * def response = session.collect()
    * match response[0].key == 'first'
    * match response[0].value == { message: 'Hello there!', info: { first: 1, second: true } }