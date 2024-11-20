package queries.dragon;

import com.intuit.karate.junit5.Karate;

class DragonRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("dragon").relativeTo(getClass());
    }    

}
