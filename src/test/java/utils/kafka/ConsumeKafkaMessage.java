package utils.kafka;

import java.util.Arrays;
import java.util.Properties;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.serialization.StringDeserializer;

public class ConsumeKafkaMessage {

  private KafkaConsumer<String, String> kafkaConsumer;

  public ConsumeKafkaMessage(String brokers, String groupId) {
    Properties properties = configureKafka(brokers, groupId);
    this.kafkaConsumer = new KafkaConsumer<>(properties);
  }

  private Properties configureKafka(String brokers, String groupId) {
    Properties properties = new Properties();
    properties.put("bootstrap.servers", brokers);
    properties.put("key.deserializer", StringDeserializer.class.getName());
    properties.put("value.deserializer", StringDeserializer.class.getName());
    properties.put("group.id", groupId);
    return properties;
  }

  public void consumeMessages(String topic) {
    try {
      System.out.println("Consuming messages from Kafka topic: " + topic);
      kafkaConsumer.subscribe(Arrays.asList(topic));
      while (true) {
        ConsumerRecords<String, String> records = kafkaConsumer.poll(100);
        records.forEach(record -> {
          System.out.println("Key: " + record.key() + ", Value: " + record.value());
        });
      }
    } catch (Exception e) {
      System.out.println("Failed to consume messages from Kafka: " + e.getMessage());
    }
  }

  public static void main(String[] args) {
    ConsumeKafkaMessage consumeKafkaMessage = new ConsumeKafkaMessage("localhost:9092",
        "test-consumer-group");
    consumeKafkaMessage.consumeMessages("test-topic");
  }

}
