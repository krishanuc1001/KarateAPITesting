package utils;

import java.util.List;
import java.util.Properties;
import java.util.concurrent.CountDownLatch;
import java.util.stream.Collectors;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.TopicPartition;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class KafkaOffsetConfigReset {

  private static final Logger logger = LoggerFactory.getLogger(KafkaOffsetConfigReset.class);
  private KafkaConsumer<String, String> kafka;
  private String kafkaTopic;
  private final CountDownLatch startUpLatch = new CountDownLatch(1);

  public KafkaOffsetConfigReset(String kafkaTopic, Properties consumerProperties) {
    this.kafkaTopic = kafkaTopic;
    consumerProperties.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG,
        StringDeserializer.class.getName());
    consumerProperties.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG,
        StringDeserializer.class.getName());
    this.kafka = new KafkaConsumer<>(consumerProperties);
  }

  public void resetOffset() {
    final List<TopicPartition> partitions = kafka.partitionsFor(kafkaTopic)
        .stream()
        .map(partitionInfo -> new TopicPartition(kafkaTopic, partitionInfo.partition()))
        .collect(Collectors.toList());

    kafka.assign(partitions);
    kafka.seekToEnd(partitions);

    Thread t = new Thread(() -> {
      logger.info("Waiting for Consumer to be ready....");
      startUpLatch.countDown();
    });
    t.start();

    try {
      startUpLatch.await();
    } catch (InterruptedException e) {
      logger.error("Error while waiting for the Consumer to be ready", e.getMessage());
      Thread.currentThread().interrupt();
    }

  }

}
