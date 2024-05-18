package runner;

import com.intuit.karate.junit5.Karate;

public class RunnerTest {

  /**
   * This method is used to run the Karate tests using Karate-core dependency.
   */
  //  public static void main(String[] args) {
  //    Runner.path("src/test/java/features").parallel(2);
  //  }

  /**
   * This method is used to run the Karate tests using Karate-junit5 dependency.
   */
  @Karate.Test
  Karate testRunner() {
    return Karate.run("classpath:features");
  }

}
