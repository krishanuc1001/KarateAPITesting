package utils.kafka;

import java.util.Properties;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;

public class PublishKafkaMessage {

  private KafkaProducer<String, String> kafkaProducer;

  public PublishKafkaMessage(String brokers) {
    Properties properties = configureKafka(brokers);
    this.kafkaProducer = new KafkaProducer<>(properties);
  }

  private Properties configureKafka(String brokers) {
    Properties properties = new Properties();
    properties.put("bootstrap.servers", brokers);
    properties.put("key.serializer", StringSerializer.class.getName());
    properties.put("value.serializer", StringSerializer.class.getName());
    return properties;
  }

  public void sendMessage(String topic, String key, String message) {
    try {
      System.out.println("Sending message to Kafka topic: " + topic);
      ProducerRecord<String, String> record = new ProducerRecord<>(topic, key, message);
      kafkaProducer.send(record);
      kafkaProducer.flush();
    } catch (Exception e) {
      System.out.println("Failed to send message to Kafka: " + e.getMessage());
    }
  }

  public void closeProducer() {
    kafkaProducer.close();
  }

  public static void main(String[] args) {
    PublishKafkaMessage publishMessageToTopic = new PublishKafkaMessage("localhost:9092");
    publishMessageToTopic.sendMessage("test-topic", "key", "Hello, Kafka!");
    publishMessageToTopic.sendMessage("test-topic", "key", "<<=====MSG PRODUCED ONE=======>>");
    publishMessageToTopic.sendMessage("test-topic", "key", "<<=====MSG PRODUCED TWO=======>>");
    publishMessageToTopic.closeProducer();
  }

}
