package performance;

import com.intuit.karate.gatling.javaapi.KarateProtocolBuilder;

import io.gatling.javaapi.core.ScenarioBuilder;
import io.gatling.javaapi.core.Simulation;

import static io.gatling.javaapi.core.CoreDsl.*;
import static com.intuit.karate.gatling.javaapi.KarateDsl.*;

public class GatlingSimulation extends Simulation {

  KarateProtocolBuilder protocol = karateProtocol();

  ScenarioBuilder smokeTest = scenario("smoke")
      .exec(karateFeature("classpath:queries/launchesPast/launchesPast.feature", "@performance"))
      .pause(5,10)
      .exec(karateFeature("classpath:queries/rockets/rockets.feature", "@performance"));

  {
    setUp(
        smokeTest.injectOpen(
          nothingFor(2),
          constantUsersPerSec(2).during(15))
        ).protocols(protocol)
        .assertions(
            global().responseTime().mean().lt(1200),
            global().failedRequests().percent().is(0.0));
  }
}
