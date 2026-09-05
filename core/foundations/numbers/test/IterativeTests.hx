package test;

import utest.ITest;
import utest.Assert;
import src.Numbers;

class IterativeTests implements ITest {
    public function new() {}

    public function testSumOfFirstNIte():Void {
        Assert.equals(0, Numbers.sumOfFirstNIte(0));
        Assert.equals(6, Numbers.sumOfFirstNIte(3));
    }

    public function testFactorialIte():Void {
        Assert.equals(1, Numbers.factorialIte(0));
        Assert.equals(24, Numbers.factorialIte(4));
    }

    public function testFibonacciIte():Void {
        Assert.equals(0, Numbers.fibonacciIte(0));
        Assert.equals(1, Numbers.fibonacciIte(1));
        Assert.equals(8, Numbers.fibonacciIte(6));
    }

    public function testGreatestCommonDivisorIte():Void {
        Assert.equals(4, Numbers.greatestCommonDivisorIte(12, 8));
        Assert.equals(1, Numbers.greatestCommonDivisorIte(7, 5));
    }

    public function testLeastCommonMultipleIte():Void {
        Assert.equals(12, Numbers.leastCommonMultipleIte(4, 6));
        Assert.equals(24, Numbers.leastCommonMultipleIte(6, 8));
    }
}
