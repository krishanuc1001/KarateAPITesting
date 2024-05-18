package runner;

import com.intuit.karate.Runner;

public class RunnerTest {

  public static void main(String[] args) {
    Runner.path("src/test/java/features").parallel(2);
  }

}
