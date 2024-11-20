package queries.rockets;

import com.intuit.karate.junit5.Karate;

class RocketsRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("rockets").relativeTo(getClass());
    }    

}
