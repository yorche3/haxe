import utest.UTest;
import test.DataStructuresAdvancedTest;

/**
 * Main entry point that executes the DataStructuresAdvanced test suite and reports results.
 */
class RunTests {
    static public function main():Void {
        UTest.run([new DataStructuresAdvancedTest()]);
    }
}
