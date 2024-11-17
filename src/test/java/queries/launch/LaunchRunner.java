package queries.launch;

import com.intuit.karate.junit5.Karate;

class LaunchRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("launch").relativeTo(getClass());
    }    

}
