package src;

class NaiveSort {
    public static function selectionSort(arr:Array<Int>):Array<Int> {
        if (arr == null) return null;
        var n = arr.length;
        if (n <= 1) return arr;
        for (i in 0...n - 1) {
            var minIndex = i;
            for (j in i + 1...n) {
                if (arr[j] < arr[minIndex]) {
                    minIndex = j;
                }
            }
            if (minIndex != i) {
                var temp = arr[i];
                arr[i] = arr[minIndex];
                arr[minIndex] = temp;
            }
        }
        return arr;
    }

    public static function bubbleSort(arr:Array<Int>):Array<Int> {
        if (arr == null) return null;
        var n = arr.length;
        if (n <= 1) return arr;
        for (i in 0...n - 1) {
            var swapped = false;
            for (j in 0...n - i - 1) {
                if (arr[j] > arr[j + 1]) {
                    var temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    swapped = true;
                }
            }
            if (!swapped) break;
        }
        return arr;
    }

    public static function insertionSort(arr:Array<Int>):Array<Int> {
        if (arr == null) return null;
        var n = arr.length;
        if (n <= 1) return arr;
        for (i in 1...n) {
            var key = arr[i];
            var j = i - 1;
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
        return arr;
    }
}
