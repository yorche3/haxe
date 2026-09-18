package test;

import utest.ITest;
import utest.Assert;
import src.NaiveSort;

class NaiveSortTest implements ITest {
    // Casos de prueba obligatorios de la especificación 05_Naive_Sort.md
    static final standardInput:Array<Int> = [5, 2, 9, 1, 5, 6];
    static final standardOutput:Array<Int> = [1, 2, 5, 5, 6, 9];

    static final sortedInput:Array<Int> = [1, 2, 3, 4, 5];
    static final sortedOutput:Array<Int> = [1, 2, 3, 4, 5];

    static final reverseInput:Array<Int> = [5, 4, 3, 2, 1];
    static final reverseOutput:Array<Int> = [1, 2, 3, 4, 5];

    static final identicalInput:Array<Int> = [7, 7, 7, 7];
    static final identicalOutput:Array<Int> = [7, 7, 7, 7];

    static final negativeInput:Array<Int> = [3, -1, 4, -5, 0];
    static final negativeOutput:Array<Int> = [-5, -1, 0, 3, 4];

    static final singleInput:Array<Int> = [42];
    static final singleOutput:Array<Int> = [42];

    static final emptyInput:Array<Int> = [];
    static final emptyOutput:Array<Int> = [];

    public function new() {}

    private function assertArrayEquals(expected:Array<Int>, actual:Array<Int>, msg:String):Void {
        if (expected == null) {
            Assert.isNull(actual, msg);
            return;
        }
        Assert.notNull(actual, msg);
        Assert.equals(expected.length, actual.length, msg + " (length mismatch)");
        for (i in 0...expected.length) {
            Assert.equals(expected[i], actual[i], msg + ' (mismatch at index $i)');
        }
    }

    private function assertSortsAllCases(sortFn:(Array<Int>) -> Array<Int>, algorithm:String):Void {
        // 1. Array estándar desordenado
        var input = standardInput.copy();
        var result = sortFn(input);
        assertArrayEquals(standardOutput, result, '$algorithm should sort an unsorted array');

        // 2. Array ya ordenado
        input = sortedInput.copy();
        result = sortFn(input);
        assertArrayEquals(sortedOutput, result, '$algorithm should sort an already sorted array');

        // 3. Array en orden inverso
        input = reverseInput.copy();
        result = sortFn(input);
        assertArrayEquals(reverseOutput, result, '$algorithm should sort a reverse ordered array');

        // 4. Elementos idénticos
        input = identicalInput.copy();
        result = sortFn(input);
        assertArrayEquals(identicalOutput, result, '$algorithm should sort an array of identical elements');

        // 5. Con números negativos
        input = negativeInput.copy();
        result = sortFn(input);
        assertArrayEquals(negativeOutput, result, '$algorithm should sort an array with negative numbers');

        // 6. Un solo elemento
        input = singleInput.copy();
        result = sortFn(input);
        assertArrayEquals(singleOutput, result, '$algorithm should sort a single element array');

        // 7. Array vacío
        input = emptyInput.copy();
        result = sortFn(input);
        assertArrayEquals(emptyOutput, result, '$algorithm should sort an empty array');

        // 8. Caso nulo (Array<Int> admite null en Haxe)
        var nullResult = sortFn(null);
        Assert.isNull(nullResult, '$algorithm should return null for null input');
    }

    public function testSelectionSort():Void {
        assertSortsAllCases(NaiveSort.selectionSort, "selection_sort");
    }

    public function testBubbleSort():Void {
        assertSortsAllCases(NaiveSort.bubbleSort, "bubble_sort");
    }

    public function testInsertionSort():Void {
        assertSortsAllCases(NaiveSort.insertionSort, "insertion_sort");
    }
}
