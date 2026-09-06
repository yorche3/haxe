# 🚀 Fundamentos / Foundations — Haxe

Implementación de los ejercicios de la sección [Fundamentos / Foundations](https://yorche3.github.io/programming_languages/core/foundations/) del repositorio principal en **Haxe (Haxe 4+)**.

---

## 📖 Descripción / Description

**ES:** Esta sección reúne los conceptos esenciales para empezar a trabajar con **Haxe**. Cubre desde los programas más básicos (`Hello, World!` y `Hello, User!`) hasta la implementación de una calculadora con pruebas unitarias y algoritmos numéricos en tres enfoques progresivos (recursivo directo, recursivo con acumulador e iterativo) utilizando el intérprete Eval integrado (`--interp`) y la librería de pruebas **`utest`**.

**EN:** This section brings together the essential concepts to start working with **Haxe**. It covers everything from the most basic programs (`Hello, World!` and `Hello, User!`) to the implementation of a calculator with unit tests and numerical algorithms in three progressive approaches (direct recursion, accumulator recursion, and iterative) using the built-in Eval interpreter (`--interp`) and the **`utest`** testing library.

---

## 📁 Estructura / Structure

```text
haxe/
└── core/
    └── foundations/
        ├── README.md              # Este archivo / This file
        ├── helloworld/            # 01_Hello_World — Primer programa
        │   ├── HelloWorld.hx
        │   └── README.md
        ├── hellouser/             # 02_Hello_User — Entrada y salida
        │   ├── HelloUser.hx
        │   └── README.md
        ├── unit_test/
        │   └── calculator/        # 03_Unit_Test_Calculator — Pruebas unitarias
        │       ├── src/
        │       │   └── Calculator.hx
        │       ├── test/
        │       │   └── CalculatorTest.hx
        │       ├── RunTests.hx
        │       ├── build.hxml
        │       └── README.md
        └── numbers/               # 04_Numbers — Algoritmos numéricos
            ├── src/
            │   └── Numbers.hx
            ├── test/
            │   ├── RecursiveTests.hx
            │   └── IterativeTests.hx
            ├── RunTests.hx
            ├── build.hxml
            └── README.md
```

---

## 🔢 Progresión / Progression

| Especificación | Proyecto | Conceptos | Dependencias externas |
| -------------- | -------- | --------- | :-------------------: |
| [`01_Hello_World`](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) | [`helloworld/`](helloworld/) | Clase `HelloWorld`, `static public function main()`, `haxe.Log.trace`, `--interp` | ❌ Solo stdlib |
| [`02_Hello_User`](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) | [`hellouser/`](hellouser/) | `Sys.stdin().readLine()`, entrada por consola en targets sys | ❌ Solo stdlib |
| [`03_Unit_Test_Calculator`](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) | [`unit_test/calculator/`](unit_test/calculator/) | Paquetes (`src`, `test`), `utest.ITest`, `UTest.run`, `build.hxml` | ✅ utest |
| [`04_Numbers`](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) | [`numbers/`](numbers/) | Recursión, iteración, acumuladores, helpers privados, TCO | ✅ utest |

---

## 🛠️ Enfoque general / General Approach

**ES:** Los proyectos en esta sección siguen un patrón progresivo:

1. **Hello World** y **Hello User**: Programas de un solo archivo ejecutables directamente con `haxe --run <Clase>` o `haxe --main <Clase> --interp`. Usan exclusivamente la biblioteca estándar.
2. **Calculator**: Introduce el uso de la librería de pruebas **`utest`** (`haxelib install utest`), separación de fuentes (`src/`) y pruebas (`test/`), y configuración mediante `build.hxml`.
3. **Numbers**: Extiende el patrón con múltiples suites de pruebas unitarias por enfoque. La versión con acumulador (`_acc`) se conserva en el fuente como puente didáctico, ejecutando las suites recursiva e iterativa (22 pruebas en total en entornos sin TCO garantizado).

**EN:** The projects in this section follow a progressive pattern:

1. **Hello World** and **Hello User**: Single-file programs executable directly with `haxe --run <Class>` or `haxe --main <Class> --interp`. Use only the standard library.
2. **Calculator**: Introduces the **`utest`** testing library (`haxelib install utest`), source (`src/`) and test (`test/`) separation, and configuration via `build.hxml`.
3. **Numbers**: Expands the pattern with multiple unit test suites per approach. The accumulator version (`_acc`) is kept in source code as an educational bridge, running recursive and iterative suites (22 total tests in non-guaranteed TCO environments).

---

## 🚀 Ejecución rápida / Quick Start

### Hello World

```bash
cd haxe/core/foundations/helloworld
haxe --run HelloWorld
```

### Hello User

```bash
cd haxe/core/foundations/hellouser
haxe --run HelloUser
```

### Calculator (pruebas)

```bash
cd haxe/core/foundations/unit_test/calculator
haxe build.hxml
```

### Numbers (pruebas)

```bash
cd haxe/core/foundations/numbers
haxe build.hxml
```

---

*[← Volver a Core](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
