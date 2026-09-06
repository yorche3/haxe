import utest.UTest;
import test.CalculatorTest;

/**
 * Main entry point that executes the Calculator test suite and reports results.
 */
class RunTests {
    static public function main():Void {
        UTest.run([new CalculatorTest()]);
    }
}
