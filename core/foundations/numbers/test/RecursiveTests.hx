package test;

import utest.ITest;
import utest.Assert;
import src.Numbers;

class RecursiveTests implements ITest {
    public function new() {}

    public function testSumOfFirstNRec():Void {
        Assert.equals(0, Numbers.sumOfFirstNRec(0));
        Assert.equals(6, Numbers.sumOfFirstNRec(3));
    }

    public function testFactorialRec():Void {
        Assert.equals(1, Numbers.factorialRec(0));
        Assert.equals(24, Numbers.factorialRec(4));
    }

    public function testFibonacciRec():Void {
        Assert.equals(0, Numbers.fibonacciRec(0));
        Assert.equals(1, Numbers.fibonacciRec(1));
        Assert.equals(8, Numbers.fibonacciRec(6));
    }

    public function testGreatestCommonDivisorRec():Void {
        Assert.equals(4, Numbers.greatestCommonDivisorRec(12, 8));
        Assert.equals(1, Numbers.greatestCommonDivisorRec(7, 5));
    }

    public function testLeastCommonMultipleRec():Void {
        Assert.equals(12, Numbers.leastCommonMultipleRec(4, 6));
        Assert.equals(24, Numbers.leastCommonMultipleRec(6, 8));
    }
}
