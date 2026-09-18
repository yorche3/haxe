# Algorithms Pure — Haxe

Implementaciones de la [Fase 1 — Algoritmos Puros](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-) en **Haxe 4**: ordenamientos elementales, estructuras de datos propias, ordenamientos óptimos y distribuidos, y búsqueda.

Los módulos de esta fase trabajan sobre `Array<Int>`, que en Haxe **es mutable**, **admite `null`** y se ordena *in-place*.

---

## 📂 Módulos / Modules

| Módulo | Especificación | Enfoque | Tests | Estado |
|--------|---------------|---------|:-----:|:------:|
| [`naive_sort/`](naive_sort/) | [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) | `haxe build.hxml` + utest | 3 | ✅ |

---

## 📁 Estructura / Structure

```text
algorithms/
└── naive_sort/                  # 05_Naive_Sort
    ├── build.hxml
    ├── .gitignore
    ├── RunTests.hx              # Entry point (-main RunTests)
    ├── src/
    │   └── NaiveSort.hx         # selectionSort, bubbleSort, insertionSort
    ├── test/
    │   └── NaiveSortTest.hx     # 3 tests × (7 casos + caso nulo)
    └── README.md
```

---

## 🛠️ Patrón común / Common Pattern

| Característica | Descripción |
|---------------|-------------|
| **Runtime** | Intérprete Eval integrado de Haxe 4 (`--interp`), sin binarios intermedios |
| **CLI** | `haxe build.hxml` — compila y ejecuta |
| **Build** | `build.hxml` en la raíz del módulo, con comentarios explicativos |
| **Dependencias** | `haxelib install utest` (`-lib utest`) |
| **Framework de tests** | utest — la suite implementa `utest.ITest` |
| **Entry point** | `RunTests.hx` con `UTest.run([...])`, declarado como `-main` |
| **Separación** | `src/` (paquete `src`) ↔ `test/` (paquete `test`); `-cp .` cubre ambos |
| **Iteración** | Bucles `for (i in a...b)` y `while`; rangos que excluyen el límite superior |
| **Visibilidad** | `static public` en la clase del módulo, como `Numbers` en `numbers/` |
| **Naming** | `camelCase` (`selectionSort`); archivos y clases en `PascalCase` |
| **Indicador de fallo** | `null` — se devuelve tal cual, sin lanzar excepciones |
| **Warnings** | `-w -WDeprecatedEnumAbstract` silencia un aviso interno de utest; la compilación no emite ninguno |
| **Artefactos** | `.haxelib/`, `.haxelsp/recording/`, `dump/`, `bin/` — ignorados en `.gitignore` |

---

## 🚀 Compilación rápida / Quick Build

```bash
# Naive Sort Tests
cd naive_sort
haxe build.hxml
```

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

## ▶️ Siguiente / Next

👉 Continúa con los módulos pendientes de esta fase en el [Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/).
👉 Continue with the pending modules of this phase in the [Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/).

---

*[← Volver a Core](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
