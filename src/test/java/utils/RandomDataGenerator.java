package utils;

import net.datafaker.Faker;

public class RandomDataGenerator {

  static Faker faker = new Faker();

  public static String getRandomNumber(int length) {
    return faker.number().digits(length);
  }

  public static String getRandomName() {
    return faker.name().fullName();
  }

  public static String getRandomJobTitle() {
    return faker.job().title();
  }

}
