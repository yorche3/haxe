# Data Structures Basics — Haxe

Implementación de la especificación [06_Data_Structures_Basics](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) en **Haxe**, con un enfoque manual y minimalista.

**ES:** Implementa `Node`, `LinkedList`, `Stack` y `Queue` sobre un único `Node` compartido, sin colecciones estándar. Se ejecuta con el intérprete Eval de Haxe (`--interp`) y el framework de pruebas **utest**.

**EN:** Implements `Node`, `LinkedList`, `Stack` and `Queue` over a single shared `Node`, with no standard collections. It runs on the Haxe Eval interpreter (`--interp`) with the **utest** test framework.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directory | Propósito / Purpose |
|---|---|
| `src/Node.hx` | Nodo compartido (`value` de solo lectura, `next` mutable) / Shared node (read-only `value`, mutable `next`) |
| `src/LinkedList.hx` | Lista enlazada simple con `head`, `tail` y `count` / Singly linked list with `head`, `tail` and `count` |
| `src/Stack.hx` | Pila LIFO con `top` y `count` / LIFO stack with `top` and `count` |
| `src/Queue.hx` | Cola FIFO con `front`, `rear` y `count` / FIFO queue with `front`, `rear` and `count` |
| `test/DataStructuresBasicsTest.hx` | Suite utest (15 pruebas, 51 aserciones) / utest suite (15 tests, 51 assertions) |
| `RunTests.hx` | Punto de entrada de las pruebas / Test entry point |
| `build.hxml` | Configuración de compilación y ejecución / Build and run configuration |
| `.gitignore` | Artefactos ignorados / Ignored artifacts |

```text
haxe/core/algorithms/data_structures_basics/
├── .gitignore
├── README.md
├── RunTests.hx
├── build.hxml
├── src/
│   ├── LinkedList.hx
│   ├── Node.hx
│   ├── Queue.hx
│   └── Stack.hx
└── test/
    └── DataStructuresBasicsTest.hx
```

**ES:** **Desviación de la ubicación esperada:** la especificación propone `src/data_structures_basics.ext`, `test/data_structures_basics_test.ext` y `test/run_tests.ext`. En Haxe cada tipo público vive en un fichero con el nombre de su clase en `PascalCase`, por lo que `src/` tiene cuatro ficheros (uno por tipo) y el punto de entrada `RunTests.hx` está en la raíz del módulo, igual que en `foundations/numbers`.

**EN:** **Deviation from the expected location:** the specification proposes `src/data_structures_basics.ext`, `test/data_structures_basics_test.ext` and `test/run_tests.ext`. In Haxe each public type lives in a file named after its class in `PascalCase`, so `src/` has four files (one per type) and the `RunTests.hx` entry point sits at the module root, as in `foundations/numbers`.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Cada estructura gestiona directamente sus punteros y su contador; `Stack` y `Queue` no delegan en `LinkedList` ni usan `Array`, `List` u otra colección. El constructor `new` es el `init` del contrato. No existe un tipo de contrato aparte (`interface`): hay una sola implementación por estructura, así que la API pública de cada clase declara el contrato.

**EN:** Each structure manages its own pointers and counter directly; `Stack` and `Queue` neither delegate to `LinkedList` nor use `Array`, `List` or any other collection. The `new` constructor is the contract's `init`. There is no separate contract type (`interface`): there is one implementation per structure, so each class's public API declares the contract.

Comando de inicialización realmente necesario / Initialization command actually required:

```bash
haxelib install utest
```

---

## 📄 Configuración clave / Key Configuration

`build.hxml`:

- `-main RunTests`: clase principal.
- `-cp .`: raíz del módulo como ruta de clases; `src` y `test` se resuelven como paquetes (`package src;`, `package test;`).
- `--interp`: ejecución en el intérprete Eval.
- `-lib utest`: librería de pruebas.
- `-w -WDeprecatedEnumAbstract`: silencia el aviso de sintaxis obsoleta de utest.

---

## 🚀 Compilación y ejecución / Build & Run

```bash
cd haxe/core/algorithms/data_structures_basics
haxe build.hxml
```

**Salida real / Actual output:**

```text
utest/ui/text/PrintReport.hx:52: 
assertations: 51
successes: 51
errors: 0
failures: 0
warnings: 0
execution time: 0

results: ALL TESTS OK (success: true)
test.DataStructuresBasicsTest
  testLinkedListAbsentValue: OK ...
  testLinkedListDeleteFirstOccurrence: OK ...
  testLinkedListEmptyState: OK ...
  testLinkedListEmptyTheList: OK ......
  testLinkedListInsertAtBothEnds: OK ..
  testNodeInitializeAndObserve: OK ..
  testNodeLinkAndTraverse: OK ..
  testQueueEmptyAfterRemoval: OK ..
  testQueueEmptyStateAndFailedRemoval: OK .....
  testQueueFifoAndNonMutatingPeek: OK ..
  testQueueRemovalAndReuse: OK ......
  testStackEmptyAfterRemoval: OK ..
  testStackEmptyStateAndFailedRemoval: OK .....
  testStackLifoAndNonMutatingPeek: OK ..
  testStackRemovalAndReuse: OK ......
```

**ES:** La compilación (Haxe 4.3.7) no emite warnings ni errores; la línea `PrintReport.hx:52` es la traza propia de utest. Acta de evidencia: [`haxe.md`](../../../../docs/evidence/algorithms/data_structures_basics/haxe.md).

**EN:** The build (Haxe 4.3.7) emits no warnings or errors; the `PrintReport.hx:52` line is utest's own trace. Evidence record: [`haxe.md`](../../../../docs/evidence/algorithms/data_structures_basics/haxe.md).

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node.new(value)` / `get_value` / `get_next` / `set_next` | `Int` → `Node`; `value`, `next` (propiedades / properties) | `O(1)` | `value` de solo lectura; `next` asignable / read-only `value`; assignable `next` |
| `LinkedList.new()` | → lista vacía / empty list | `O(1)` | `init` |
| `LinkedList.headValue` (`get_head`) | → `Int` | `O(1)` | `-1` si vacía / if empty |
| `LinkedList.isEmpty`, `size` | → `Bool`, `Int` | `O(1)` | Propiedades de solo lectura / read-only properties |
| `LinkedList.insertHead`, `insertTail` | `Int` → `Void` | `O(1)` | Actualizan `head`/`tail` y `count` / update `head`/`tail` and `count` |
| `LinkedList.delete` | `Int` → `Bool` | `O(n)` | Primera aparición; reajusta `tail` / first occurrence; re-adjusts `tail` |
| `Stack.new()`, `push`, `pop`, `topValue` (`peek`), `isEmpty`, `size` | `Int` → `Void` / `Int` | `O(1)` | `pop`/`peek` devuelven `-1` si vacía / return `-1` if empty |
| `Queue.new()`, `enqueue`, `dequeue`, `frontValue` (`peek`), `isEmpty`, `size` | `Int` → `Void` / `Int` | `O(1)` | `dequeue` anula `rear` al vaciar / `dequeue` clears `rear` when emptied |

---

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| `final class` con estado mutable y constructor como `init` / `final class` with mutable state and constructor as `init` | Estructuras inmutables que devuelven una nueva instancia / Immutable structures returning a new instance | Mantiene `O(1)` en cada operación sin copiar y permite continuar sobre la misma instancia, como piden los casos de prueba / Keeps every operation `O(1)` with no copying and lets tests continue on the same instance |
| `Node.value` de solo lectura (`default, null`) / read-only `Node.value` | `value` mutable | Ninguna operación del contrato modifica el valor tras `init` / No contract operation changes the value after `init` |

---

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `init()` / `Node.init(value)` | `new LinkedList()`, `new Stack()`, `new Queue()`, `new Node(value)` | Haxe inicializa mediante constructor; no hay instancias sin inicializar / Haxe initializes through the constructor; there are no uninitialized instances |
| `get_head()`, `peek()`, `is_empty()`, `size()` | Propiedades `headValue`, `topValue`, `frontValue`, `isEmpty`, `size` (`get`, `never`) con *getter* `inline` | Las propiedades de solo lectura son la forma idiomática de una consulta sin efectos / Read-only properties are the idiomatic form of a side-effect-free query |
| `get_value()`, `get_next()`, `set_next(next)` | Campos `value` y `next` accedidos directamente; `set_next` no devuelve el nodo / Fields `value`, `next` accessed directly; `set_next` does not return the node | Nodo mutable: la asignación basta y no se necesita devolver un nodo nuevo / Mutable node: assignment suffices; no new node is needed |
| `insert_head`, `insert_tail`, `delete`, `push`, … | `camelCase` (`insertHead`, `insertTail`, …) | Convención de nombres de Haxe / Haxe naming convention |
| `is_empty()` = `count == 0` | `isEmpty` evalúa `head == null` (`top`, `front`) | Equivalente observable: el contador es cero exactamente cuando no hay nodos / Observably equivalent: the counter is zero exactly when there are no nodes |
| `delete`: `if tail == current` | `if (current.next == null)` | Equivalente: el nodo es la cola exactamente cuando no tiene siguiente / Equivalent: the node is the tail exactly when it has no next |
| Estructura sin valores iniciales antes de `init` / Structure with no initial values before `init` | No representable: el constructor siempre inicializa / Not representable: the constructor always initializes | Haxe no permite instancias a medio construir / Haxe has no half-constructed instances |

---

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `LinkedList.headValue` | Lista vacía / empty list | `-1` | `new LinkedList().headValue` → `-1` |
| `LinkedList.delete` | Valor ausente / value absent | `false` (éxito: `true`) | `delete(99)` → `false` |
| `Stack.pop`, `Stack.topValue` | Pila vacía / empty stack | `-1` | `new Stack().pop()` → `-1` |
| `Queue.dequeue`, `Queue.frontValue` | Cola vacía / empty queue | `-1` | `new Queue().dequeue()` → `-1` |
| `insertHead`, `insertTail`, `push`, `enqueue` | Sin límite de capacidad / no capacity limit | No aplica / Not applicable | — |
| Caso nulo / Null case | Las operaciones reciben `Int`, que no admite `null` en Haxe | No representable / Not representable | `null` solo existe en los enlaces `next`, `head`, `tail`, `top`, `front`, `rear` |

---

## ✅ Cobertura de pruebas / Test coverage

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| Node: inicializar y observar / initialize and observe | Sí | `testNodeInitializeAndObserve` (`test/DataStructuresBasicsTest.hx:22`) | |
| Node: enlazar y recorrer / link and traverse | Sí | `testNodeLinkAndTraverse` (`:28`) | |
| LinkedList: estado vacío / empty state | Sí | `testLinkedListEmptyState` (`:40`) | |
| LinkedList: insertar por ambos extremos / insert at both ends | Sí | `testLinkedListInsertAtBothEnds` (`:47`) | Observa `size` y `get_head`; el orden completo no se recorre / observes `size` and `get_head`; the full order is not traversed |
| LinkedList: eliminar primera aparición / delete first occurrence | Sí | `testLinkedListDeleteFirstOccurrence` (`:57`) | Ídem; el recorrido `5, 20, 10` no se comprueba / same; the `5, 20, 10` traversal is not checked |
| LinkedList: valor ausente / absent value | Sí | `testLinkedListAbsentValue` (`:69`) | |
| LinkedList: vaciar / empty the list | Sí | `testLinkedListEmptyTheList` (`:80`) | |
| Stack: vacío y extracción fallida / empty and failed removal | Sí | `testStackEmptyStateAndFailedRemoval` (`:100`) | |
| Stack: LIFO y `peek` no mutante / LIFO and non-mutating `peek` | Sí | `testStackLifoAndNonMutatingPeek` (`:110`) | |
| Stack: extracción y reutilización / removal and reuse | Sí | `testStackRemovalAndReuse` (`:119`) | |
| Stack: vacío tras extracción / empty after removal | Sí | `testStackEmptyAfterRemoval` (`:137`) | |
| Queue: vacío y extracción fallida / empty and failed removal | Sí | `testQueueEmptyStateAndFailedRemoval` (`:149`) | |
| Queue: FIFO y `peek` no mutante / FIFO and non-mutating `peek` | Sí | `testQueueFifoAndNonMutatingPeek` (`:159`) | |
| Queue: extracción y reutilización / removal and reuse | Sí | `testQueueRemovalAndReuse` (`:168`) | |
| Queue: vacío tras extracción / empty after removal | Sí | `testQueueEmptyAfterRemoval` (`:186`) | |

**ES:** Cada prueba reconstruye el estado de su escenario sobre una instancia nueva y ejecuta varios pasos sobre ella; no hay una sola instancia compartida entre pruebas. Total: 15 pruebas, 51 aserciones.

**EN:** Each test rebuilds its scenario's state on a fresh instance and runs several steps on it; no single instance is shared across tests. Total: 15 tests, 51 assertions.

---

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| El indicador de fallo `-1` colisiona con un valor `-1` almacenado / The `-1` failure indicator collides with a stored `-1` | Los valores almacenados deben ser enteros positivos, como fija la especificación / Stored values must be positive integers, as the specification states | Sin `Option` en esta fase / No `Option` in this phase |
| Las pruebas de `LinkedList` no recorren la lista completa / `LinkedList` tests do not traverse the whole list | El orden interno solo se verifica por `get_head`, `size` y el vaciado final / Internal order is verified only through `get_head`, `size` and the final emptying | Ninguna; el contrato público no expone recorrido / None; the public contract exposes no traversal |

---

## 📝 Notas de implementación / Implementation Notes

**ES:** Las operaciones son iterativas (el único bucle es el de `delete`) y no usan recursión, así que TCO no aplica. `Null<Node>` se usa únicamente en los enlaces; los parámetros y retornos de operaciones son `Int`/`Bool`/`Void` y el caso de entrada nula no es representable (ver _Indicadores de fallo_). Las divergencias idiomáticas aceptadas están en _Adaptaciones idiomáticas_: constructor como `init`, propiedades en lugar de funciones de consulta, `camelCase` y los equivalentes `head == null` y `current.next == null`. Los comentarios de documentación de `src/` conservan la mención «Contract stub (step 4b)» heredada de un paso previo del flujo; las operaciones ya están implementadas.

**EN:** Operations are iterative (the only loop is in `delete`) and use no recursion, so TCO does not apply. `Null<Node>` is used only for links; operation parameters and returns are `Int`/`Bool`/`Void` and the null-input case is not representable (see _Failure indicators_). The accepted idiomatic divergences are listed under _Idiomatic adaptations_: constructor as `init`, properties instead of query functions, `camelCase`, and the `head == null` and `current.next == null` equivalents. The `src/` doc comments keep the "Contract stub (step 4b)" mention inherited from an earlier workflow step; the operations are already implemented.

**ES:** Este proyecto también está implementado en otros lenguajes. Explora el repositorio principal para consultar las demás versiones.

**EN:** This project is also implemented in other languages. Explore the main repository to see the other versions.

---

## 🔍 Checklist de validación / Validation checklist

- [x] La suite nativa se ejecutó y su salida real está copiada en este README.
- [x] Cada caso de la especificación tiene su fila en _Cobertura de pruebas_ (o `Omitido` con razón).
- [x] Cada desviación del pseudocódigo o de la ubicación esperada está en _Adaptaciones idiomáticas_.
- [x] Cada operación con fallo posible está en _Indicadores de fallo_.
- [x] No hay rutas absolutas del autor, credenciales ni salidas inventadas.
- [x] Los enlaces relativos resuelven dentro del repositorio y el documento es bilingüe.
- [x] Ninguna sección repite lo que ya dice la especificación.

---

## 📚 Referencias / References

| Tipo / Kind | Referencia / Reference |
|---|---|
| Especificación / Specification | [`06_Data_Structures_Basics.md`](../../../../docs/core/algorithms/06_Data_Structures_Basics.md) |
| Módulo homologado del lenguaje / Homologated module | [`haxe/core/foundations/numbers/`](../../foundations/numbers/) |
| Guía de inicialización / Initialisation guide | [`core/00_Project_Initialization_Guide.md`](../../../../docs/core/00_Project_Initialization_Guide.md) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](../../../../docs/AGENT_Template.md) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](../../../../docs/WORKFLOW.md) |
| Documentación oficial del lenguaje / Language official docs | [Haxe Manual](https://haxe.org/manual/) |

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
