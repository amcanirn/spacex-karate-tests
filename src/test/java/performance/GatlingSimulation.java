package performance;

import com.intuit.karate.gatling.javaapi.KarateProtocolBuilder;

import io.gatling.javaapi.core.ScenarioBuilder;
import io.gatling.javaapi.core.Simulation;

import static io.gatling.javaapi.core.CoreDsl.*;
import static com.intuit.karate.gatling.javaapi.KarateDsl.*;

public class GatlingSimulation extends Simulation {

  KarateProtocolBuilder protocol = karateProtocol();

  ScenarioBuilder launchScenario = scenario("launch")
      .exec(karateFeature("classpath:queries/launch/launch.feature", "@performance"));

  {
    setUp(
        launchScenario.injectOpen(constantUsersPerSec(1).during(5))).protocols(protocol)
        .assertions(
            global().responseTime().mean().lt(1200),
            global().failedRequests().percent().is(0.0));
  }
}
