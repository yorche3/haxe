package src;

/**
 * Calculator module with basic arithmetic operations using educational implementations.
 * Demonstrates how complex operations (multiplication, division, modulus) are built
 * from basic primitive operations (addition, subtraction).
 */
class Calculator {
    /**
     * Basic addition: a + b
     */
    public static function addition(a:Int, b:Int):Int {
        return a + b;
    }

    /**
     * Basic subtraction: a - b
     */
    public static function subtraction(a:Int, b:Int):Int {
        return a - b;
    }

    /**
     * Multiplication implemented as repeated addition (a added to itself b times).
     */
    public static function multiplication(a:Int, b:Int):Int {
        var result = 0;
        for (_ in 0...b) {
            result = addition(result, a);
        }
        return result;
    }

    /**
     * Division implemented as repeated subtraction (counting how many times b fits in a).
     */
    public static function division(a:Int, b:Int):Int {
        var count = 0;
        while (a >= b) {
            a = subtraction(a, b);
            count++;
        }
        return count;
    }

    /**
     * Modulus implemented using division and multiplication: a - (q * b)
     */
    public static function modulus(a:Int, b:Int):Int {
        var q = division(a, b);
        var p = multiplication(q, b);
        return subtraction(a, p);
    }
}
