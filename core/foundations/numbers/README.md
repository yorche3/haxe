# Numbers — Haxe

Implementación de la especificación [04_Numbers](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) en **Haxe**, cubriendo algoritmos numéricos en tres enfoques: recursión directa (`_rec`), recursión con acumulador (`_acc`) e iterativo (`_ite`).

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directorio | Propósito |
| -------------------- | ----------- |
| `src/Numbers.hx` | Código fuente principal: contiene los 15 métodos (5 algoritmos × 3 enfoques) más helpers privados. |
| `test/RecursiveTests.hx` | Pruebas unitarias para las versiones con recursión directa (`_rec`). |
| `test/IterativeTests.hx` | Pruebas unitarias para las versiones iterativas (`_ite`). |
| `RunTests.hx` | Punto de entrada para la ejecución de las suites de prueba. |
| `build.hxml` | Archivo de configuración de compilación de Haxe con comentarios explicativos. |
| `.gitignore` | Archivos e historias ignoradas de compilación. |

**Estructura de directorios esperada:**

```text
haxe/
└── core/
    └── foundations/
        └── numbers/
            ├── .gitignore
            ├── README.md
            ├── build.hxml
            ├── RunTests.hx
            ├── src/
            │   └── Numbers.hx
            └── test/
                ├── RecursiveTests.hx
                └── IterativeTests.hx
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto implementa los cinco algoritmos numéricos (`sumOfFirstN`, `factorial`, `fibonacci`, `greatestCommonDivisor`, `leastCommonMultiple`) en un único archivo `src/Numbers.hx`. Las pruebas usan el framework **utest**: dos clases de prueba independientes (`RecursiveTests`, `IterativeTests`) que verifican los casos de prueba definidos en la especificación, ejecutadas en el intérprete Eval de Haxe 4 (`--interp`).

**EN:** The project implements the five numerical algorithms (`sumOfFirstN`, `factorial`, `fibonacci`, `greatestCommonDivisor`, `leastCommonMultiple`) in a single `src/Numbers.hx` file. Tests use the **utest** framework: two independent test classes (`RecursiveTests`, `IterativeTests`) verifying the test cases defined in the specification, running on the Haxe 4 Eval interpreter (`--interp`).

### Inicialización / Initialization

1. Instalar la librería de pruebas utest (una sola vez):

   ```bash
   haxelib install utest
   ```

2. Crear la estructura de directorios:

   ```bash
   mkdir -p haxe/core/foundations/numbers/{src,test}
   ```

3. Configurar el archivo `build.hxml`:

   ```hxml
   -main RunTests

   # Specify the source directories for your application code and test code
   -cp .
   -cp src
   -cp test

   # Target platform for running tests (Haxe Eval interpreter)
   --interp

   # Enable compilation for the unit test library
   -lib utest

   # Suppress minor library deprecation warnings
   -w -WDeprecatedEnumAbstract
   ```

---

## 📄 Archivos de configuración clave / Key Configuration Files

`build.hxml` — Configuración de compilación:

- `-main RunTests`: Define la clase principal con el método `main`.
- `-cp .`, `-cp src`, `-cp test`: Define las rutas de búsqueda para clases y suites.
- `-lib utest`: Incluye la librería de pruebas unitarias.
- `--interp`: Corre directamente en el intérprete interno Eval de Haxe 4.
- `-w -WDeprecatedEnumAbstract`: Desactiva advertencias de sintaxis obsoleta interna en utest.

---

## 🚀 Compilación y ejecución / Build & Run

### Ejecutar las pruebas unitarias / Run tests

```bash
cd haxe/core/foundations/numbers
haxe build.hxml
```

### Salida esperada / Expected output

```text
assertations: 22
successes: 22
errors: 0
failures: 0
warnings: 0
execution time: 0

results: ALL TESTS OK (success: true)
test.IterativeTests
  testFactorialIte: OK .
  testFibonacciIte: OK .
  testGreatestCommonDivisorIte: OK .
  testLeastCommonMultipleIte: OK .
  testSumOfFirstNIte: OK .
test.RecursiveTests
  testFactorialRec: OK .
  testFibonacciRec: OK .
  testGreatestCommonDivisorRec: OK .
  testLeastCommonMultipleRec: OK .
  testSumOfFirstNRec: OK .
```

---

## 🔁 Sobre recursión con acumulador y Tail Call Optimization (TCO)

**ES:**
Tail recursion ocurre cuando la llamada recursiva es la última acción que ejecuta una función/método. En Haxe, el compilador no garantiza TCO de forma uniforme en todos los objetivos de compilación.

La versión con acumulador (`_acc`) se conserva en `src/Numbers.hx` únicamente con fines educativos: sirve como puente conceptual entre la recursión directa (`_rec`) y la versión iterativa (`_ite`). Como no hay un beneficio práctico de rendimiento garantizado en todos los objetivos, las pruebas unitarias se centran en los enfoques recursivo e iterativo (22 pruebas en total).

**EN:**
Tail recursion occurs when the recursive call is the last action executed by a function/method. In Haxe, the compiler does not guarantee TCO uniformly across all compilation targets.

The accumulator version (`_acc`) is kept in `src/Numbers.hx` purely for educational purposes: it acts as a conceptual bridge between direct recursion (`_rec`) and the iterative version (`_ite`). Since there is no guaranteed performance benefit across targets, unit tests focus on the recursive and iterative approaches (22 tests in total).

---

## 📝 Notas de implementación / Implementation Notes

| Algoritmo | Directa (`_rec`) | Acumulador (`_acc`) | Iterativo (`_ite`) |
| --------- | ---------------- | ------------------- | ------------------ |
| `sumOfFirstN` | `n + sumRec(n-1)` | Helper con `acc + n` | Bucle `1...n+1` |
| `factorial` | `n * factRec(n-1)` | Helper con `acc * n` | Bucle `2...n+1` |
| `fibonacci` | `fibRec(n-1) + fibRec(n-2)` | Helper con `acc2, acc1` | Bucle de intercambio de variables |
| `greatestCommonDivisor` | Euclides recursivo (`b, a % b`) | Euclides helper | Euclides con `while (b != 0)` |
| `leastCommonMultiple` | `(a * b) / gcdRec(a, b)` | `(a * b) / gcdAcc(a, b)` | `(a * b) / gcdIte(a, b)` |

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
