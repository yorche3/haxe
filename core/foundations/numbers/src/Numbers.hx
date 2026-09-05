package src;

class Numbers {

    public static function sumOfFirstNRec(n:Int):Int {
        if (n <= 0) {
            return 0;
        }
        return n + sumOfFirstNRec(n - 1);
    }

    public static function factorialRec(n:Int):Int {
        if (n <= 0) {
            return 1;
        }
        return n * factorialRec(n - 1);
    }

    public static function fibonacciRec(n:Int):Int {
        if (n <= 0) {
            return 0;
        }
        if (n == 1) {
            return 1;
        }
        return fibonacciRec(n - 1) + fibonacciRec(n - 2);
    }

    public static function greatestCommonDivisorRec(a:Int, b:Int):Int {
        if (b == 0) {
            return a;
        }
        return greatestCommonDivisorRec(b, a % b);
    }

    public static function leastCommonMultipleRec(a:Int, b:Int):Int {
        return Std.int((a * b) / greatestCommonDivisorRec(a, b));
    }

    public static function sumOfFirstNAcc(n:Int):Int {
        return sumOfFirstNAccHelp(n, 0);
    }

    private static function sumOfFirstNAccHelp(n:Int, acc:Int):Int {
        if (n <= 0) {
            return acc;
        }
        return sumOfFirstNAccHelp(n - 1, n + acc);
    }

    public static function factorialAcc(n:Int):Int {
        return factorialAccHelp(n, 1);
    }

    private static function factorialAccHelp(n:Int, acc:Int):Int {
        if (n <= 1) {
            return acc;
        }
        return factorialAccHelp(n - 1, n * acc);
    }

    public static function fibonacciAcc(n:Int):Int {
        return fibonacciAccHelp(n, 0, 1);
    }

    private static function fibonacciAccHelp(n:Int, acc2:Int, acc1:Int):Int {
        if (n <= 0) {
            return acc2;
        }
        if (n <= 2) {
            return acc1 + acc2;
        }
        return fibonacciAccHelp(n - 1, acc1, acc1 + acc2);
    }

    public static function greatestCommonDivisorAcc(a:Int, b:Int):Int {
        return greatestCommonDivisorAccHelp(a, b);
    }

    private static function greatestCommonDivisorAccHelp(a:Int, b:Int):Int {
        if (b == 0) {
            return a;
        }
        return greatestCommonDivisorAccHelp(b, a % b);
    }

    public static function leastCommonMultipleAcc(a:Int, b:Int):Int {
        return Std.int((a * b) / greatestCommonDivisorAcc(a, b));
    }

    public static function sumOfFirstNIte(n:Int):Int {
        var result = 0;
        for (i in 1...n + 1) {
            result += i;
        }
        return result;
    }

    public static function factorialIte(n:Int):Int {
        var result = 1;
        for (i in 2...n + 1) {
            result *= i;
        }
        return result;
    }

    public static function fibonacciIte(n:Int):Int {
        if (n <= 0) {
            return 0;
        }
        if (n == 1) {
            return 1;
        }
        var acc2 = 0;
        var acc1 = 1;
        for (_ in 2...n + 1) {
            var temp = acc1 + acc2;
            acc2 = acc1;
            acc1 = temp;
        }
        return acc1;
    }

    public static function greatestCommonDivisorIte(a:Int, b:Int):Int {
        while (b != 0) {
            var temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    public static function leastCommonMultipleIte(a:Int, b:Int):Int {
        return Std.int((a * b) / greatestCommonDivisorIte(a, b));
    }
}
