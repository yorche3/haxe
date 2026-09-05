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

No se requieren directorios adicionales de compilación, pruebas ni archivos de proyecto. El archivo `.hx` es autocontenido y puede ejecutarse directamente con el intérprete de Haxe o compilarse a cualquier objetivo.

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

No se requieren archivos de configuración de build. Haxe compila directamente desde línea de comandos con la bandera `--main` (módulo de entrada) más el objetivo deseado (`--interp`, `--js`, `--cpp`, `--cs`, `--java`, `--python`, etc.).

Opcionalmente se puede usar un archivo `.hxml` para guardar los argumentos de compilación, pero para un único archivo no es necesario.

El `.gitignore` de la raíz del lenguaje ya cubre artefactos generados:

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

### Compilar a un objetivo nativo / Compile to a native target (opcional)

```bash
# JavaScript
haxe --main HelloWorld --js hello.js

# C++ (requiere toolchain de C++)
haxe --main HelloWorld --cpp bin/
```

### Salida esperada / Expected output

```text
Hello, World! from Haxe!
```

---

## 📝 Notas de implementación / Implementation Notes

**ES:** Haxe es un lenguaje multi-objetivo: el mismo código fuente puede compilarse a JavaScript, C++, C#, Java, Python, JVM, HL, etc. El punto de entrada de un programa es una clase con un método `static public function main()` (el nombre del archivo debe coincidir con el nombre de la clase). La salida por consola se hace con `haxe.Log.trace`, disponible en todos los objetivos.

**EN:** Haxe is a multi-target language: the same source code can be compiled to JavaScript, C++, C#, Java, Python, JVM, HL, etc. A program's entry point is a class with a `static public function main()` method (the file name must match the class name). Console output is done with `haxe.Log.trace`, available on all targets.

```haxe
class HelloWorld {
    static public function main() {
        haxe.Log.trace("Hello, World! from Haxe!", null);
    }
}
```

| Elemento | Propósito |
|----------|-----------|
| `class HelloWorld` | Clase principal; el archivo debe llamarse `HelloWorld.hx`. |
| `static public function main()` | Punto de entrada del programa. |
| `haxe.Log.trace(...)` | Imprime a la salida estándar en todos los objetivos. |

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
