package queries.rocket;

import com.intuit.karate.junit5.Karate;

class RocketRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("rocket").relativeTo(getClass());
    }    

}
