# Calculator — Haxe

Implementación de la especificación [03_Unit_Test_Calculator](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) en **Haxe**, con un enfoque modular usando el framework de pruebas **utest** (estándar en Haxe 4) y el intérprete Eval integrado.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directorio | Propósito |
| -------------------- | ----------- |
| `src/Calculator.hx` | Código fuente principal: operaciones `addition`, `subtraction`, `multiplication`, `division` y `modulus`. |
| `test/CalculatorTest.hx` | Clase de pruebas que implementa `utest.ITest` para verificar las 5 operaciones. |
| `RunTests.hx` | Punto de entrada que ejecuta la suite de pruebas mediante `UTest.run`. |
| `build.hxml` | Archivo de configuración de compilación y ejecución de Haxe. |
| `.gitignore` | Archivos e historias ignoradas de compilación. |

**Estructura de directorios esperada:**

```text
haxe/
└── core/
    └── foundations/
        └── unit_test/
            └── calculator/
                ├── .gitignore
                ├── README.md
                ├── build.hxml
                ├── RunTests.hx
                ├── src/
                │   └── Calculator.hx
                └── test/
                    └── CalculatorTest.hx
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto implementa la clase `Calculator` con métodos estáticos en `src/Calculator.hx` usando implementaciones educativas (suma repetitiva para multiplicación, resta repetitiva para división y módulo). Las pruebas emplean el framework **utest**: `CalculatorTest` implementa `utest.ITest` con aserciones `Assert.equals`, y `RunTests` las ejecuta directamente con `UTest.run` corriendo en el intérprete Eval de Haxe 4 (`--interp`).

**EN:** The project implements the `Calculator` class with static methods in `src/Calculator.hx` using educational implementations (repeated addition for multiplication, repeated subtraction for division and modulus). Tests use the **utest** framework: `CalculatorTest` implements `utest.ITest` with `Assert.equals` assertions, and `RunTests` executes them directly via `UTest.run` running on the Haxe 4 Eval interpreter (`--interp`).

### Inicialización / Initialization

1. Instalar la librería de pruebas utest (una sola vez):

   ```bash
   haxelib install utest
   ```

2. Crear la estructura de directorios:

   ```bash
   mkdir -p haxe/core/foundations/unit_test/calculator/{src,test}
   ```

3. Configurar el archivo `build.hxml`:

   ```hxml
   -main RunTests
   -cp .
   -lib utest
   --interp
   -w -WDeprecatedEnumAbstract
   ```

---

## 📄 Archivos de configuración clave / Key Configuration Files

`build.hxml` — Configuración de compilación:

- `-main RunTests`: Define la clase principal con el método `main`.
- `-cp .`: Agrega la raíz del proyecto al classpath (resuelve los paquetes `src` y `test`).
- `-lib utest`: Vincula la biblioteca de pruebas unitarias utest.
- `--interp`: Ejecuta el programa directamente en el intérprete de Haxe (Eval) sin requerir compilación a C++ o Neko.
- `-w -WDeprecatedEnumAbstract`: Silencia una advertencia menor de compatibilidad interna en utest.

---

## 🚀 Compilación y ejecución / Build & Run

### Ejecutar las pruebas unitarias / Run tests

```bash
cd haxe/core/foundations/unit_test/calculator
haxe build.hxml
```

### Salida esperada / Expected output

```text
assertations: 5
successes: 5
errors: 0
failures: 0
warnings: 0
execution time: 0

results: ALL TESTS OK (success: true)
test.CalculatorTest
  testAddition: OK .
  testDivision: OK .
  testModulus: OK .
  testMultiplication: OK .
  testSubtraction: OK .
```

---

## 📝 Notas de implementación / Implementation Notes

| Operación | Implementación educativa |
| --------- | ------------------------ |
| `addition(a, b)` | Suma directa (`a + b`). |
| `subtraction(a, b)` | Resta directa (`a - b`). |
| `multiplication(a, b)` | Suma repetitiva: acumula `a`, `b` veces (`for (_ in 0...b)`). |
| `division(a, b)` | Resta repetitiva: resta `b` de `a` mientras `a >= b` contando las iteraciones. |
| `modulus(a, b)` | Resta repetitiva basada en las operaciones anteriores: `a - (q * b)`. |

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
