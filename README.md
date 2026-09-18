# Haxe

Proyectos en **Haxe (Haxe 4+)**, utilizando el intérprete Eval integrado (`--interp`) y la librería de pruebas **utest**.

---

## 📂 Módulos / Modules

| Módulo | Descripción |
| ------ | ----------- |
| [`core/foundations/`](core/foundations/) | **Fase 0 — Fundamentos**: `helloworld`, `hellouser`, `unit_test/calculator`, `numbers` |
| [`core/algorithms/`](core/algorithms/) | **Fase 1 — Algoritmos Puros**: `naive_sort` |

---

## ▶️ Comenzar / Getting Started

```bash
# Hello, World!
cd core/foundations/helloworld
haxe --run HelloWorld

# Hello, User!
cd core/foundations/hellouser
haxe --run HelloUser

# Calculator Tests
cd core/foundations/unit_test/calculator
haxe build.hxml

# Numbers Tests
cd core/foundations/numbers
haxe build.hxml

# Naive Sort Tests
cd core/algorithms/naive_sort
haxe build.hxml
```

---

## 📦 Requisitos / Requirements

| Herramienta | Instalación |
| ----------- | ----------- |
| [Haxe 4+](https://haxe.org/download/) | `sudo apt install haxe` (Linux) / `winget install HaxeFoundation.Haxe` (Windows) / [Descargar](https://haxe.org/download/) |
| [utest](https://lib.haxe.org/p/utest/) | `haxelib install utest` |

```bash
# Verificar instalación
haxe --version
```

---

## 🏗️ Tipos de proyecto / Project Types

### 1. Programa simple (sin dependencias)

**ES:** Un único archivo fuente, sin dependencias externas, ejecutable directamente con el intérprete integrado Eval (`haxe --run <Clase>` o `haxe --main <Clase> --interp`). Ideal para `helloworld` y `hellouser`.

**EN:** A single source file, no external dependencies, executable directly with the built-in Eval interpreter (`haxe --run <Class>` or `haxe --main <Class> --interp`). Ideal for `helloworld` and `hellouser`.

```bash
haxe --run <ClassName>
```

### 2. Proyecto con pruebas unitarias (build.hxml + utest)

**ES:** Para proyectos con pruebas unitarias, se utilizan archivos de configuración `.hxml` (`build.hxml`) para definir la clase principal, el classpath (`-cp .`), las dependencias (`-lib utest`) y el objetivo de compilación (`--interp`). El código fuente se organiza en `src/` y las pruebas en `test/`.

**EN:** For projects with unit tests, `.hxml` build configuration files (`build.hxml`) define the main entry class, classpath (`-cp .`), dependencies (`-lib utest`), and compilation target (`--interp`). Source code goes in `src/` and tests in `test/`.

```bash
haxelib install utest
haxe build.hxml
```

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
