import utest.UTest;
import test.RecursiveTests;
import test.IterativeTests;

/**
 * Main entry point for executing test suites for the Numbers module.
 */
class RunTests {
    static public function main():Void {
        UTest.run([
            new RecursiveTests(),
            new IterativeTests()
        ]);
    }
}
