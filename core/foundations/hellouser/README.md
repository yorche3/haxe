# Hello User — Haxe

Implementación de la especificación [02_Hello_User](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) en **Haxe**, con un enfoque manual y minimalista.

---

## 📂 Archivos y estructura / Files & Structure

El proyecto consiste en un único archivo fuente, sin herramienta de construcción ni dependencias externas.

| Archivo / Directorio | Propósito |
|----------------------|-----------|
| `HelloUser.hx` | Código fuente: solicita el nombre, lo guarda en `name` y saluda. |

**Estructura de directorios esperada:**

```text
haxe/
└── core/
    └── foundations/
        └── hellouser/
            └── HelloUser.hx
```

No se requieren directorios adicionales de compilación, pruebas ni archivos de proyecto.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto se creó manualmente, sin herramientas de scaffolding. Haxe no necesita manifiesto ni herramienta de construcción para un único archivo: el compilador (`haxe`) se invoca directamente.

**EN:** The project was created manually, without scaffolding tools. Haxe needs no manifest or build tool for a single file: the compiler (`haxe`) is invoked directly.

### Inicialización / Initialization

1. Crear la estructura de directorios:

   ```bash
   mkdir -p haxe/core/foundations/hellouser
   ```

2. Escribir el archivo `HelloUser.hx` con el código fuente.

3. No se necesita ningún paso adicional de construcción o vinculación de dependencias.

---

## 📄 Archivos de configuración clave / Key Configuration Files

No se requieren archivos de configuración de build. Haxe compila directamente desde línea de comandos con la bandera `--main` (módulo de entrada) más el objetivo deseado (`--interp`, `--cpp`, `--cs`, `--java`, `--python`, etc.).

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
cd core/foundations/hellouser
haxe --run HelloUser
```

Equivalente:

```bash
haxe --main HelloUser --interp
```

### Compilar a un objetivo nativo / Compile to a native target (opcional)

```bash
# JavaScript (no soporta Sys.stdin; ver notas)
haxe --main HelloUser --js hello.js

# C++ (requiere toolchain de C++)
haxe --main HelloUser --cpp bin/
```

### Salida esperada / Expected output

```text
Enter your name: John
Hello, John
```

> **ES:** Reemplaza `John` por cualquier nombre que ingrese el usuario.
> **EN:** Replace `John` with whatever name the user enters.

---

## 📝 Notas de implementación / Implementation Notes

**ES:** La entrada de consola se lee con `Sys.stdin().readLine()` y se almacena en la variable `name`. La clase `Sys` solo está disponible en los objetivos de *sistema* (`--interp`, Neko, C++, C#, Java, Python, etc.), por lo que este programa debe ejecutarse con `--interp`/`--run` o compilarse a uno de esos objetivos; **no funcionará** en objetivos de navegador como JavaScript puro, donde no existe `stdin`.

**EN:** Console input is read with `Sys.stdin().readLine()` and stored in the variable `name`. The `Sys` class is only available on *sys* targets (`--interp`, Neko, C++, C#, Java, Python, etc.), so this program must be run with `--interp`/`--run` or compiled to one of those targets; it will **not work** on browser targets like plain JavaScript, where `stdin` doesn't exist.

```haxe
class HelloUser {
    static public function main() {
        haxe.Log.trace("Enter your name: ", null);
        var name = Sys.stdin().readLine();
        haxe.Log.trace("Hello, " + name, null);
    }
}
```

| Elemento | Propósito |
|----------|-----------|
| `class HelloUser` | Clase principal; el archivo debe llamarse `HelloUser.hx`. |
| `var name` | Declaración de la variable que almacena el nombre leído. |
| `Sys.stdin().readLine()` | Lee una línea de la entrada estándar (solo objetivos sys). |
| `haxe.Log.trace(...)` | Imprime a la salida estándar en todos los objetivos. |

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
