# Hello World — Haxe

Implementación de la especificación [01_Hello_World](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) en **Haxe**, con un enfoque manual y minimalista.

---

## 📂 Archivos y estructura / Files & Structure

El proyecto consiste en un único archivo fuente, sin herramienta de construcción ni dependencias externas.

| Archivo / Directorio | Propósito |
|----------------------|-----------|
| `HelloWorld.hx` | Código fuente principal: clase `HelloWorld` con el punto de entrada `main`. |

**Estructura de directorios esperada:**

```text
haxe/
└── core/
    └── foundations/
        └── helloworld/
            └── HelloWorld.hx
```

No se requieren directorios adicionales de compilación, pruebas ni archivos de proyecto. El archivo `.hx` es autocontenido y se ejecuta directamente con el intérprete de Haxe; compilarlo a otros objetivos depende de que su toolchain esté instalada.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto se creó manualmente, sin herramientas de scaffolding, para controlar cada detalle y mantener la máxima sencillez. Haxe no necesita manifiesto ni herramienta de construcción para un único archivo: el compilador (`haxe`) se invoca directamente.

**EN:** The project was created manually, without scaffolding tools, to control every detail and keep it as simple as possible. Haxe needs no manifest or build tool for a single file: the compiler (`haxe`) is invoked directly.

### Inicialización / Initialization

1. Crear la estructura de directorios:

   ```bash
   mkdir -p haxe/core/foundations/helloworld
   ```

2. Escribir el archivo `HelloWorld.hx` con el código fuente.

3. No se necesita ningún paso adicional de construcción o vinculación de dependencias.

---

## 📄 Archivos de configuración clave / Key Configuration Files

No se requieren archivos de configuración de build. Haxe compila directamente desde línea de comandos con la bandera `--main` (módulo de entrada) más el objetivo deseado (`--interp`, `--cpp`, `--java`…). En este módulo la salida se hace con `Sys.println`, que solo existe en los objetivos `sys`: el camino verificado es el intérprete.

Opcionalmente se puede usar un archivo `.hxml` para guardar los argumentos de compilación, pero para un único archivo no es necesario.

El `.gitignore` del módulo cubre los artefactos de compilación (`/bin/`) y el de la raíz del lenguaje cubre las cachés de `haxelib`:

```gitignore
.haxelib/
.haxelsp/recording/
dump/
```

---

## 🚀 Compilación y ejecución / Build & Run

### Ejecutar con el intérprete / Run with the interpreter

```bash
cd core/foundations/helloworld
haxe --main HelloWorld --interp
```

Equivalente abreviado:

```bash
haxe -cp . --run HelloWorld
```

### Objetivos adicionales / Additional targets

**ES:** `Sys.println` solo existe en los objetivos `sys`. El objetivo **JavaScript no lo admite** (`Accessing this field requires a system platform`) y los nativos necesitan su toolchain: el de C++ exige la librería `hxcpp` (`Error: Library hxcpp is not installed` en el entorno de verificación). Por eso aquí solo se documentan comandos con salida comprobada: el intérprete.

**EN:** `Sys.println` only exists on `sys` targets. The **JavaScript target does not support it** (`Accessing this field requires a system platform`) and the native ones need their toolchain: the C++ target requires the `hxcpp` library (`Error: Library hxcpp is not installed` in the verification environment). That is why only commands with checked output are documented here: the interpreter.

### Salida esperada / Expected output

```text
Hello, World! from Haxe!
```

---

## 📝 Notas de implementación / Implementation Notes

**ES:** Haxe es un lenguaje multi-objetivo: el mismo código fuente puede compilarse a JavaScript, C++, C#, Java, Python, JVM, HL, etc. El punto de entrada de un programa es una clase con un método `static public function main()` (el nombre del archivo debe coincidir con el nombre de la clase). En los objetivos `sys` —el intérprete (`--run`, `--interp`) y los nativos— la salida por consola se hace con `Sys.println`, que escribe en la salida estándar; `haxe.Log.trace` es la utilidad de **depuración** y su destino depende del objetivo.

**EN:** Haxe is a multi-target language: the same source code can be compiled to JavaScript, C++, C#, Java, Python, JVM, HL, etc. A program's entry point is a class with a `static public function main()` method (the file name must match the class name). On `sys` targets —the interpreter (`--run`, `--interp`) and the native ones— console output is done with `Sys.println`, which writes to standard output; `haxe.Log.trace` is the **debug** facility and its destination depends on the target.

```haxe
class HelloWorld {
    static public function main() {
        Sys.println("Hello, World! from Haxe!");
    }
}
```

| Elemento | Propósito |
|----------|-----------|
| `class HelloWorld` | Clase principal; el archivo debe llamarse `HelloWorld.hx`. |
| `static public function main()` | Punto de entrada del programa. |
| `Sys.println(...)` | Escribe la línea en la **salida estándar**; es la forma idiomática de un programa de consola en los objetivos `sys`. |

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
