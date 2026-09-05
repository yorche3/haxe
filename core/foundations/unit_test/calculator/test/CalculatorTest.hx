package test;

import utest.ITest;
import utest.Assert;
import src.Calculator;

/**
 * Unit tests for the Calculator module using the utest framework.
 */
class CalculatorTest implements ITest {
    public function new() {}

    public function testAddition():Void {
        Assert.equals(5, Calculator.addition(2, 3));
    }

    public function testSubtraction():Void {
        Assert.equals(3, Calculator.subtraction(5, 2));
    }

    public function testMultiplication():Void {
        Assert.equals(12, Calculator.multiplication(3, 4));
    }

    public function testDivision():Void {
        Assert.equals(3, Calculator.division(10, 3));
    }

    public function testModulus():Void {
        Assert.equals(1, Calculator.modulus(10, 3));
    }
}
