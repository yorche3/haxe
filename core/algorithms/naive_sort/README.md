# Naive Sort — Haxe

Implementación de la especificación [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) en **Haxe 4**, con el intérprete Eval integrado (`--interp`) y la librería de pruebas **utest**.

Los tres algoritmos elementales de ordenamiento ($O(n^2)$) — **Selection Sort**, **Bubble Sort** e **Insertion Sort** — trabajan **in-place** sobre `Array<Int>` y no invocan ninguna biblioteca de ordenamiento: sólo comparaciones e intercambios paso a paso.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directorio | Propósito |
| -------------------- | ----------- |
| `src/NaiveSort.hx` | Las 3 funciones del contrato (`selectionSort`, `bubbleSort`, `insertionSort`). |
| `test/NaiveSortTest.hx` | Suite utest: 3 tests × (7 casos + caso nulo). |
| `RunTests.hx` | Punto de entrada que ejecuta la suite. |
| `build.hxml` | Configuración de compilación de Haxe con comentarios explicativos. |
| `.gitignore` | Artefactos ignorados (`.haxelib/`, `dump/`, `bin/`, …). |

**Estructura de directorios esperada:**

```text
naive_sort/
├── .gitignore
├── build.hxml
├── RunTests.hx
├── src/
│   └── NaiveSort.hx
└── test/
    └── NaiveSortTest.hx
```

A diferencia de `foundations/numbers/`, que reparte sus enfoques en dos clases de prueba (`RecursiveTests`, `IterativeTests`), aquí los tres algoritmos comparten un único contrato `Array<Int> -> Array<Int>` y una única tabla de casos, así que una sola clase `NaiveSortTest` los recorre con un helper común.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Proyecto de estructura manual (`mkdir -p src test`) más un `build.hxml`, siguiendo la convención de `numbers/`. El código fuente vive en `src/` (paquete `src`) y las pruebas en `test/` (paquete `test`), y todo se ejecuta directamente sobre el intérprete Eval de Haxe 4, sin generar artefactos intermedios.

**EN:** Manually structured project (`mkdir -p src test`) plus a `build.hxml`, following the `numbers/` convention. Source code lives in `src/` (package `src`) and tests in `test/` (package `test`), and everything runs directly on the Haxe 4 Eval interpreter, with no intermediate artifacts.

### Inicialización / Initialization

```bash
haxelib install utest
mkdir -p haxe/core/algorithms/naive_sort/{src,test}
```

---

## 📄 Configuración clave / Key Configuration Files

### `build.hxml` – Configuración de compilación

**ES:** Declara la clase principal, el classpath, la dependencia `utest` y el objetivo `--interp`. La única opción de warnings es `-w -WDeprecatedEnumAbstract`, que silencia una advertencia interna de la propia librería utest; con ella, la compilación no emite **ningún** aviso.

**EN:** It declares the main class, the classpath, the `utest` dependency and the `--interp` target. The only warning option is `-w -WDeprecatedEnumAbstract`, which silences an internal warning from the utest library itself; with it, the compilation emits **no** warnings at all.

```hxml
-main RunTests

# Specify the source directories for application and test code
-cp .

# Target platform for running tests (Haxe Eval interpreter)
--interp

# Enable compilation for the unit test library
-lib utest

# Suppress minor library deprecation warnings
-w -WDeprecatedEnumAbstract
```

### `.gitignore` – Archivos ignorados

```gitignore
.haxelib/
.haxelsp/recording/
dump/
bin/
```

**ES:** `haxe build.hxml` con `--interp` no genera artefactos, así que estas entradas cubren los residuos de las herramientas de Haxe y de objetivos alternativos como `-neko bin/RunTests.n` (comentado en el `build.hxml`).

**EN:** `haxe build.hxml` with `--interp` produces no artifacts, so these entries cover leftovers from the Haxe tooling and from alternative targets such as `-neko bin/RunTests.n` (commented out in `build.hxml`).

---

## 🚀 Compilación y ejecución / Build & Run

### Compilar y ejecutar las pruebas / Build and run tests

```bash
haxe build.hxml
```

**Salida real / Actual output:**

```text
$ haxe build.hxml
utest/ui/text/PrintReport.hx:52:
assertations: 123
successes: 123
errors: 0
failures: 0
warnings: 0
execution time: 0

results: ALL TESTS OK (success: true)
test.NaiveSortTest
  testBubbleSort: OK .........................................
  testInsertionSort: OK .........................................
  testSelectionSort: OK .........................................
```

> **ES:** El compilador no emite ningún diagnóstico y el reporte de utest marca `warnings: 0`. Las **123 aserciones** salen de las 3 funciones × 8 casos (7 de la especificación + el nulo), desglosadas por `assertArrayEquals` en una comprobación de longitud más una por elemento.
>
> **EN:** The compiler emits no diagnostics and the utest report shows `warnings: 0`. The **123 assertions** come from the 3 functions × 8 cases (the 7 specification ones + the null one), broken down by `assertArrayEquals` into one length check plus one per element.

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Algoritmo | Estrategia | Complejidad | In-place |
|-----------|------------|-------------|:--------:|
| `selectionSort` | Busca el mínimo del tramo no ordenado y lo intercambia al inicio, con la guarda `minIndex != i` | $O(n^2)$ siempre | ✅ |
| `bubbleSort` | Compara e intercambia adyacentes por pasadas, con **salida temprana** mediante la bandera `swapped` | $O(n^2)$ peor/promedio, $O(n)$ mejor | ✅ |
| `insertionSort` | Inserta cada elemento en el sub-array ya ordenado desplazando los mayores | $O(n^2)$ peor/promedio, $O(n)$ mejor | ✅ |

### Casos cubiertos / Covered cases

| Caso | Entrada | Salida esperada |
|------|---------|-----------------|
| Array estándar desordenado | `[5, 2, 9, 1, 5, 6]` | `[1, 2, 5, 5, 6, 9]` |
| Array ya ordenado | `[1, 2, 3, 4, 5]` | `[1, 2, 3, 4, 5]` |
| Array en orden inverso | `[5, 4, 3, 2, 1]` | `[1, 2, 3, 4, 5]` |
| Elementos idénticos | `[7, 7, 7, 7]` | `[7, 7, 7, 7]` |
| Con números negativos | `[3, -1, 4, -5, 0]` | `[-5, -1, 0, 3, 4]` |
| Un solo elemento | `[42]` | `[42]` |
| Array vacío | `[]` | `[]` |
| **Entrada nula** | `null` | `null` |

---

## 📝 Notas de implementación / Implementation Notes

### 🧬 Ordenamiento *in-place* / In-place sorting

**ES:** El pseudocódigo ordena el propio array con `swap(arr, i, j)`, y Haxe lo permite literalmente: `Array<Int>` es mutable y se pasa por referencia, así que los tres algoritmos modifican el array recibido y lo devuelven. No se asigna ninguna estructura auxiliar.

Como los *fixtures* de la suite son constantes compartidas a nivel de clase, cada caso ordena una **copia** creada con `.copy()`. Sin ese aislamiento, el primer algoritmo dejaría los datos ordenados y los siguientes pasarían con entradas ya resueltas.

**EN:** The pseudocode sorts the array itself with `swap(arr, i, j)`, and Haxe allows it literally: `Array<Int>` is mutable and passed by reference, so all three algorithms modify the received array and return it. No auxiliary structure is allocated.

Since the suite's fixtures are class-level shared constants, each case sorts a **copy** created with `.copy()`. Without that isolation, the first algorithm would leave the data sorted and the following ones would pass with already-solved inputs.

### 🆗 Indicador de fallo con `null` / Failure indicator via `null`

**ES:** `Array<Int>` admite `null` en Haxe, así que el caso nulo **sí es representable**: las tres funciones empiezan con `if (arr == null) return null;` y devuelven `null` como indicador de fallo, sin lanzar excepciones. El caso nulo se prueba de forma explícita y separada del caso vacío, porque `null` y `[]` son valores distintos.

**EN:** `Array<Int>` admits `null` in Haxe, so the null case **is representable**: all three functions start with `if (arr == null) return null;` and return `null` as the failure indicator, without throwing exceptions. The null case is tested explicitly and separately from the empty case, because `null` and `[]` are different values.

### 🔁 La bandera `swapped` con `break` / The `swapped` flag with `break`

**ES:** El criterio de aceptación exige conservar la optimización de salida temprana. Se implementa con `var swapped = false;` dentro del bucle externo y `if (!swapped) break;` al terminarlo, exactamente como el pseudocódigo: en cuanto una pasada completa no realiza ningún intercambio, el bucle termina y una lista ya ordenada se resuelve en **una sola pasada** ($O(n)$ en el mejor caso).

**EN:** The acceptance criteria require preserving the early-exit optimization. It is implemented with `var swapped = false;` inside the outer loop and `if (!swapped) break;` when it finishes, exactly as in the pseudocode: as soon as a full pass performs no swap, the loop ends and an already sorted list is resolved in **a single pass** ($O(n)$ best case).

### ➿ Cotas de los bucles / Loop bounds

**ES:** A diferencia de las variantes recursivas de otros lenguajes de la fase, esta implementación reproduce las cotas del pseudocódigo tal cual: `for (i in 0...n - 1)` con `for (j in i + 1...n)` en `selectionSort`, y `for (j in 0...n - i - 1)` en `bubbleSort`, cuya pasada se acorta en cada iteración. Los rangos `0...n` de Haxe excluyen el límite superior, de modo que se leen igual que el pseudocódigo.

**EN:** Unlike the recursive variants in other languages of the phase, this implementation reproduces the pseudocode's bounds as-is: `for (i in 0...n - 1)` with `for (j in i + 1...n)` in `selectionSort`, and `for (j in 0...n - i - 1)` in `bubbleSort`, whose pass shortens on each iteration. Haxe's `0...n` ranges exclude the upper bound, so they read exactly like the pseudocode.

### 🔀 Estabilidad de `insertionSort` / `insertionSort` stability

**ES:** El bucle interno desplaza mientras `arr[j] > key` (estrictamente mayor), así que un elemento igual no se mueve y la ordenación es **estable**.

**EN:** The inner loop shifts while `arr[j] > key` (strictly greater), so an equal element does not move and the sort is **stable**.

### 🏷️ Naming y visibilidad / Naming and visibility

**ES:** La especificación nombra las funciones en `snake_case` (`selection_sort`); Haxe y el módulo hermano `numbers/` usan `camelCase`, así que la API es `selectionSort`, `bubbleSort` e `insertionSort`. Las tres son métodos `static public` de la clase `NaiveSort`, invocadas como `NaiveSort.selectionSort(arr)`, igual que `Numbers.sumOfFirstNRec(n)`. Cada cuerpo es autocontenido: los bucles van inline, sin helpers auxiliares.

**EN:** The specification names the functions in `snake_case` (`selection_sort`); Haxe and the sibling `numbers/` module use `camelCase`, so the API is `selectionSort`, `bubbleSort` and `insertionSort`. All three are `static public` methods of the `NaiveSort` class, invoked as `NaiveSort.selectionSort(arr)`, just like `Numbers.sumOfFirstNRec(n)`. Each body is self-contained: the loops are inlined, with no auxiliary helpers.

### 🧪 Estructura de los tests / Test structure

**ES:** La suite `NaiveSortTest` implementa `utest.ITest` con el mismo patrón que los demás lenguajes:

- **Constantes con nombre** para cada entrada y salida esperada (`standardInput`, `standardOutput`, `reverseInput`, …), sin duplicar literales.
- Un **helper compartido** `assertSortsAllCases(sortFn:(Array<Int>) -> Array<Int>, algorithm:String)` que recibe la función a probar y el nombre del algoritmo, y ejecuta los 8 casos.
- Un helper privado `assertArrayEquals` que compara longitud y elemento a elemento, con `Assert.isNull` para el caso nulo.
- **Un test por función** del contrato: `testSelectionSort`, `testBubbleSort` y `testInsertionSort`, que llaman al helper con la función correspondiente.
- El mensaje de cada aserción es `'$algorithm should sort {caso}'`, así que un fallo identifica el algoritmo y el caso, y añade el índice donde discrepa: `selection_sort should sort an unsorted array (mismatch at index 1)`.
- **Aislamiento**: cada caso ordena una copia del fixture (`.copy()`), porque los algoritmos ordenan *in-place*.

**EN:** The `NaiveSortTest` suite implements `utest.ITest` following the same pattern as the other languages:

- **Named constants** for every input and expected output (`standardInput`, `standardOutput`, `reverseInput`, …), with no duplicated literals.
- A **shared helper** `assertSortsAllCases(sortFn:(Array<Int>) -> Array<Int>, algorithm:String)` that receives the function under test and the algorithm name, and runs the 8 cases.
- A private `assertArrayEquals` helper that compares length and element by element, with `Assert.isNull` for the null case.
- **One test per contract function**: `testSelectionSort`, `testBubbleSort` and `testInsertionSort`, which call the helper with the corresponding function.
- Each assertion message is `'$algorithm should sort {case}'`, so a failure identifies the algorithm and the case, and adds the index where they differ: `selection_sort should sort an unsorted array (mismatch at index 1)`.
- **Isolation**: each case sorts a copy of the fixture (`.copy()`), because the algorithms sort in place.

### 📍 Desviaciones respecto a la ubicación esperada / Deviations from the expected location

| Especificación | Implementación | Motivo |
|----------------|----------------|--------|
| `src/naive_sort.ext` | `src/NaiveSort.hx` | Haxe exige que el archivo se llame como la clase y usa `PascalCase`; `src/` sí coincide. |
| `test/naive_sort_test.ext` | `test/NaiveSortTest.hx` | Misma convención de nombre por clase; `test/` sí coincide. |
| `test/run_tests.ext` | `RunTests.hx` | El punto de entrada existe en la raíz del módulo (`-main RunTests`) porque `-cp .` incluye el directorio; así lo hace `numbers/`. |

**ES:** Este proyecto también está implementado en otros lenguajes. Explora el repositorio principal para consultar las demás versiones.

**EN:** This project is also implemented in other languages. Explore the main repository to see the other versions.

---

*[← Volver a Algoritmos Puros](../README.md) · [↑ Volver a Core](../../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
