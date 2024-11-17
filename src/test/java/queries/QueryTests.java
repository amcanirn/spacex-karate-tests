package queries;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class QueryTests {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:queries")
                //.outputCucumberJson(true)
                .parallel(8);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
