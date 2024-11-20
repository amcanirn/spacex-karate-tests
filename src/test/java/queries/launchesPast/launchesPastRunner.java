package queries.launchesPast;

import com.intuit.karate.junit5.Karate;

class launchesPastRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("launchesPast").relativeTo(getClass());
    }    

}
