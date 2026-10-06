import utest.UTest;
import test.DataStructuresBasicsTest;

/**
 * Main entry point that executes the DataStructuresBasics test suite and reports results.
 */
class RunTests {
    static public function main():Void {
        UTest.run([new DataStructuresBasicsTest()]);
    }
}
