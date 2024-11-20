package queries;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class QueryTests {

    private static final int THREADS = Integer.parseInt(System.getProperty("THREADS", "8"));

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:queries")
                //.outputCucumberJson(true)
                .parallel(THREADS);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
