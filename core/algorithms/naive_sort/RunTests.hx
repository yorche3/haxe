import utest.UTest;
import test.NaiveSortTest;

/**
 * Main entry point that executes the NaiveSort test suite and reports results.
 */
class RunTests {
    static public function main():Void {
        UTest.run([new NaiveSortTest()]);
    }
}

