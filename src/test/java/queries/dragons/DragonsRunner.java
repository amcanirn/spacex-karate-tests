package queries.dragons;

import com.intuit.karate.junit5.Karate;

class DragonsRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("dragons").relativeTo(getClass());
    }    

}
