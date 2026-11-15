# Data Structures Advanced — Haxe

Implementación de la especificación [07_Data_Structures_Advanced](https://yorche3.github.io/programming_languages/core/algorithms/07_Data_Structures_Advanced/) en **Haxe**, con un enfoque manual y minimalista.

**ES:** Implementa una base `Node` con valor, `TreeNode` con enlaces izquierdo/derecho para `BinaryTree` (árbol binario de búsqueda), y `GraphNode` con registro canónico enlazado y adyacencia dirigida para `Graph`. Se ejecuta con el intérprete Eval de Haxe (`--interp`) y el framework de pruebas **utest**.

**EN:** Implements a `Node` value base, `TreeNode` with left/right links for `BinaryTree` (binary search tree), and `GraphNode` with a linked canonical registry and directed adjacency for `Graph`. It runs on the Haxe Eval interpreter (`--interp`) with the **utest** test framework.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directory | Propósito / Purpose |
|---|---|
| `src/Node.hx` | Base común con valor (`value` de solo lectura, constructor privado de paquete) / Shared base with value (read-only `value`, package-private constructor) |
| `src/TreeNode.hx` | Nodo de árbol binario derivado de `Node` con enlaces mutables `left` y `right` / Binary tree node derived from `Node` with mutable `left` and `right` links |
| `src/BinaryTree.hx` | Árbol binario de búsqueda con `insert`, `contains`, `isEmpty` y `size` / Binary search tree with `insert`, `contains`, `isEmpty` and `size` |
| `src/Graph.hx` | Grafo dirigido con registro enlazado `GraphNode` y operaciones de adyacencia / Directed graph with linked `GraphNode` registry and adjacency operations |
| `test/DataStructuresAdvancedTest.hx` | Suite utest (23 pruebas, 162 aserciones) / utest suite (23 tests, 162 assertions) |
| `RunTests.hx` | Punto de entrada de las pruebas / Test entry point |
| `build.hxml` | Configuración de compilación y ejecución / Build and run configuration |
| `.gitignore` | Artefactos ignorados / Ignored artifacts |

```text
haxe/core/algorithms/data_structures_advanced/
├── .gitignore
├── README.md
├── RunTests.hx
├── build.hxml
├── src/
│   ├── BinaryTree.hx
│   ├── Graph.hx
│   ├── Node.hx
│   └── TreeNode.hx
└── test/
    └── DataStructuresAdvancedTest.hx
```

**ES:** **Desviación de la ubicación esperada:** la especificación propone `src/data_structures_advanced.ext`, `test/data_structures_advanced_test.ext` y `test/run_tests.ext`. Siguiendo la convención idiomática de Haxe y el precedente de `data_structures_basics`, cada clase pública vive en su propio archivo en `PascalCase` dentro de `src/`, el nodo auxiliar `GraphNode` vive como clase privada en `src/Graph.hx` accesible por `@:allow(src.Graph)`, y el punto de entrada `RunTests.hx` se sitúa en la raíz del módulo.

**EN:** **Deviation from the expected location:** the specification proposes `src/data_structures_advanced.ext`, `test/data_structures_advanced_test.ext` and `test/run_tests.ext`. Following Haxe's idiomatic convention and the precedent from `data_structures_basics`, each public class lives in its own `PascalCase` file inside `src/`, helper `GraphNode` lives as a private class inside `src/Graph.hx` accessible via `@:allow(src.Graph)`, and entry point `RunTests.hx` resides at module root.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** `TreeNode` y `GraphNode` heredan de la clase base `Node(value)` mediante herencia clásica (`extends Node`). `BinaryTree` implementa un árbol binario de búsqueda sin capacidad contractual máxima, con recorridos `O(h)`. `Graph` mantiene su registro global de vértices como una lista enlazada canónica manual sobre `nextVertex` (`O(V)` en búsqueda por etiqueta), e inserta vecinos de forma ordenada y sin duplicados en `Array<Int>` mediante inserción ordenada manual en `O(d(u))`. No se delega en `Map`, `HashMap` ni algoritmos de biblioteca. `Graph.getNeighbors` devuelve una copia superficial (`copy()`) garantizando aislamiento del resultado frente a mutaciones.

**EN:** `TreeNode` and `GraphNode` inherit from the `Node(value)` base class via classical inheritance (`extends Node`). `BinaryTree` implements a BST without contractual capacity limits, with `O(h)` traversals. `Graph` maintains its global vertex registry as a manual canonical linked list over `nextVertex` (`O(V)` label lookup), and inserts neighbours in ascending order without duplicates into `Array<Int>` via manual sorted insertion in `O(d(u))`. No delegation to `Map`, `HashMap` or library algorithms is used. `Graph.getNeighbors` returns a shallow copy (`copy()`) ensuring result isolation against mutations.

Comando de inicialización realmente necesario / Initialization command actually required:

```bash
haxelib install utest
```

---

## 📄 Configuración clave / Key Configuration

`build.hxml`:

- `-main RunTests`: clase principal que ejecuta las pruebas.
- `-cp .`: raíz del módulo como ruta de clases; `src` y `test` se resuelven como paquetes (`package src;`, `package test;`).
- `--interp`: ejecución inmediata en el intérprete Eval de Haxe sin generar binarios intermedios.
- `-lib utest`: biblioteca de pruebas unitarias.
- `-w -WDeprecatedEnumAbstract`: suprime la advertencia de sintaxis obsoleta interna de la biblioteca utest.

---

## 🚀 Compilación y ejecución / Build & Run

```bash
cd haxe/core/algorithms/data_structures_advanced
haxe build.hxml
```

**Salida real / Actual output:**

```text
utest/ui/text/PrintReport.hx:52: 
assertations: 162
successes: 162
errors: 0
failures: 0
warnings: 0
execution time: 0.002

results: ALL TESTS OK (success: true)
test.DataStructuresAdvancedTest
  testBinaryTreeCreateEmpty: OK ...
  testBinaryTreeIdempotentDuplicate: OK ........
  testBinaryTreeInsertLowerAndHigher: OK .......
  testBinaryTreeInsertRoot: OK ....
  testBinaryTreeMissingValueInNonemptyTree: OK ...
  testBinaryTreeMultilevelBranches: OK ...........
  testBinaryTreeOrderedInsertions: OK ............
  testGraphCreateEmpty: OK .....
  testGraphDuplicateEdge: OK ......
  testGraphDuplicateVertexPreservesAdjacency: OK ........
  testGraphIsolatedVertex: OK ......
  testGraphMissingEdgeQuery: OK ....
  testGraphMissingEndpointWithoutMutation: OK ................
  testGraphNeighbourResultIsolation: OK ............
  testGraphNeighboursOfMissingVertex: OK .....
  testGraphNonconsecutiveLabelsDirectedEdge: OK .......
  testGraphSelfLoopAndDuplicate: OK .......
  testGraphSortedNeighboursAndCounts: OK ..................
  testTreeNodeAbsentInitialLinks: OK ..
  testTreeNodeCreate: OK .
  testTreeNodeLinkTwoChildren: OK ..
  testTreeNodeTraverseEachLink: OK ........
  testTreeNodeUnlinkChildren: OK .......
```

**ES:** La compilación (Haxe 4.3.7) no emite errores ni advertencias; la traza `PrintReport.hx:52` corresponde al reporter de utest.

**EN:** The build (Haxe 4.3.7) emits no errors or warnings; the `PrintReport.hx:52` line is utest's standard report trace.

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node.new(value)` / `get_value` | `Int` → `Node`; `value` (`Int`) | `O(1)` | Base local con solo el valor; constructor privado de paquete / Local value-only base; package-private constructor |
| `TreeNode.new(value)` | `Int` → `TreeNode` | `O(1)` | Hereda de `Node`; `left` y `right` inicializados a `null` / Inherits from `Node`; `left` and `right` initialized to `null` |
| `TreeNode.left`, `TreeNode.right` | `Null<TreeNode>` (get/set) | `O(1)` | Propiedades mutables de enlace / Mutable link properties |
| `BinaryTree.new()` | → árbol vacío / empty tree | `O(1)` | `init`; `_root = null`, `_count = 0` |
| `BinaryTree.insert(value)` | `Int` → `Bool` | `O(h)` | Inserción iterativa en ABB; devuelve `true`; duplicado idempotente sin incrementar tamaño / Iterative BST insertion; returns `true`; duplicate idempotent without growing size |
| `BinaryTree.contains(value)` | `Int` → `Bool` | `O(h)` | Búsqueda iterativa según invariante ABB / Iterative search following BST invariant |
| `BinaryTree.isEmpty`, `size` | → `Bool`, `Int` | `O(1)` | Propiedades de solo lectura / Read-only properties |
| `GraphNode.new(label)` | `Int` → `GraphNode` | `O(1)` | Clase privada interna; hereda de `Node`; vecinos en `Array<Int>` y enlace `nextVertex` / Internal private class; inherits from `Node`; neighbours in `Array<Int>` and `nextVertex` link |
| `Graph.new()` | → grafo vacío / empty graph | `O(1)` | `init`; `_vertices = null`, contadores en 0 |
| `Graph.addVertex(label)` | `Int` → `Bool` | `O(V)` | Búsqueda manual en registro canónico; prepend si es nuevo; conserva vecinos si duplicado / Manual traversal of canonical registry; prepends if new; preserves neighbours if duplicate |
| `Graph.addEdge(u, v)` | `Int, Int` → `Bool` | `O(V + d(u))` | Exige existencia de `u` y `v`; inserción ordenada manual en adyacencia; duplicados idempotentes / Requires both `u` and `v`; manual sorted insertion in adjacency; duplicate idempotent |
| `Graph.hasEdge(u, v)` | `Int, Int` → `Bool` | `O(V + d(u))` | Búsqueda en registro y en adyacencia de `u` / Search in registry and in adjacency of `u` |
| `Graph.getNeighbors(u)` | `Int` → `Null<Array<Int>>` | `O(V + d(u))` | Devuelve copia independiente ordenada; `null` si `u` no existe / Returns sorted independent copy; `null` if `u` is missing |
| `Graph.isEmpty`, `vertexCount`, `edgeCount` | → `Bool`, `Int`, `Int` | `O(1)` | Propiedades de solo lectura / Read-only properties |

---

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| Herencia clásica (`extends Node`) para `TreeNode` y `GraphNode` / Classical inheritance (`extends Node`) for `TreeNode` and `GraphNode` | Composición con valor embebido / Composition with embedded value | Haxe soporta herencia de clases de forma nativa e idiomática sin sobrecoste de indirección / Haxe natively and idiomatically supports class inheritance without extra indirection overhead |
| Registro de vértices mediante lista enlazada propia (`nextVertex`) / Vertex registry via custom linked list (`nextVertex`) | `Map<Int, GraphNode>` o array indexado / `Map<Int, GraphNode>` or indexed array | Cumple la exigencia contractual de no delegar en colecciones asociativas y permite etiquetas no consecutivas en `O(V)` / Fulfills the contractual requirement against associative collections and handles non-consecutive labels in `O(V)` |
| Almacenamiento de vecinos en `Array<Int>` con inserción ordenada manual / Neighbour storage in `Array<Int>` with manual sorted insertion | `haxe.ds.List` enlazada o `Map` / Linked `haxe.ds.List` or `Map` | Permite indexación y ordenación en `O(d(u))` y clonación eficiente en `O(d(u))` con `copy()`, cumpliendo el aislamiento / Enables `O(d(u))` indexing/ordering and efficient `O(d(u))` cloning via `copy()`, fulfilling isolation |
| `final class` para `TreeNode`, `BinaryTree` y `Graph` / `final class` for `TreeNode`, `BinaryTree` and `Graph` | Clases abiertas / Open classes | Evita herencia no contemplada por el diseño y favorece optimizaciones del compilador Haxe / Prevents unintended subclassing and aids Haxe compiler optimizations |

---

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `init()` / `TreeNode.init(value)` / `GraphNode.init(label)` | Constructores `new TreeNode(value)`, `new BinaryTree()`, `new Graph()` | Haxe instancia e inicializa clases mediante su método constructor `new` / Haxe instantiates and initializes classes via its `new` constructor |
| `get_left()`, `set_left(node)`, `get_value()` | Propiedades con getters/setters (`left`, `right`, `value`) | En Haxe las propiedades (`var left(get, set)`) proporcionan acceso idiomático conservando encapsulación / In Haxe, properties (`var left(get, set)`) provide idiomatic access while retaining encapsulation |
| `is_empty()`, `size()`, `vertex_count()`, `edge_count()` | Propiedades de solo lectura (`isEmpty`, `size`, `vertexCount`, `edgeCount`) | Consultas de estado puras sin efectos secundarios se exponen idiomáticamente como propiedades en Haxe / Pure side-effect-free state queries are idiomatically exposed as read-only properties in Haxe |
| `add_vertex`, `add_edge`, `has_edge`, `get_neighbors` | Nombres en `camelCase` (`addVertex`, `addEdge`, `hasEdge`, `getNeighbors`) | Convención de nombres estándar de Haxe / Standard Haxe naming convention |
| Ausencia de enlace o vértice | `null` con tipo anulable `Null<T>` | Representación nativa de ausencia de referencias en Haxe / Native representation of absent references in Haxe |
| Retorno ausente en `get_neighbors(u)` cuando `u` no existe | Retorno de `null` (`Null<Array<Int>>`) frente a `[]` para vértice aislado | Distingue fallo de consulta de una lista de adyacencia vacía válida sin ambigüedad / Distinguishes query failure from an empty valid adjacency list unambiguously |
| `TreeNode` inmutable (caso opcional) | No aplica (TreeNode es mutable) | Haxe utiliza referencias mutables directas para estructuras enlazadas en esta fase / Haxe uses direct mutable references for linked structures in this phase |

---

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `BinaryTree.contains` | Valor ausente / Absent value | `false` | `new BinaryTree().contains(50)` → `false` |
| `Graph.addEdge` | Extremo `u` o `v` inexistente / Missing endpoint `u` or `v` | `false` | `new Graph().addEdge(10, 99)` → `false` |
| `Graph.hasEdge` | Arista inexistente o extremo ausente / Missing edge or endpoint | `false` | `new Graph().hasEdge(10, 30)` → `false` |
| `Graph.getNeighbors` | Vértice `u` inexistente / Missing vertex `u` | `null` | `new Graph().getNeighbors(99)` → `null` |
| Caso nulo / Null input case | Parámetros son enteros primitivos `Int` | No representable / Not representable | `Int` no admite `null` en plataformas estáticas / `Int` does not admit `null` on static targets |
| Límite contractual / Contractual capacity limit | Estructuras dinámicas no acotadas | No aplica / Not applicable | No existe estado «lleno» contractual / No contractual full state |

---

## ✅ Cobertura de pruebas / Test coverage

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| TreeNode: Crear un nodo de árbol / Create a tree node | Sí | `testTreeNodeCreate` (`test/DataStructuresAdvancedTest.hx:45`) | `unidad/variante: TreeNode → TreeNode.hx` |
| TreeNode: Enlaces iniciales ausentes / Absent initial links | Sí | `testTreeNodeAbsentInitialLinks` (`test/DataStructuresAdvancedTest.hx:50`) | Verifica `left == null` y `right == null` |
| TreeNode: Enlazar dos hijos / Link two children | Sí | `testTreeNodeLinkTwoChildren` (`test/DataStructuresAdvancedTest.hx:56`) | Verifica enlaces a nodos 20 y 30 |
| TreeNode: Recorrer cada enlace / Traverse each link | Sí | `testTreeNodeTraverseEachLink` (`test/DataStructuresAdvancedTest.hx:64`) | Recorre enlaces y comprueba enlaces nulos en hojas |
| TreeNode: Desenlazar hijos / Unlink children | Sí | `testTreeNodeUnlinkChildren` (`test/DataStructuresAdvancedTest.hx:80`) | Desenlaza izquierdo y derecho sucesivamente |
| TreeNode: Adaptación inmutable / Immutable adaptation | Omitido | — | `TreeNode` es mutable en Haxe; caso no aplicable |
| BinaryTree: Crear vacío / Create empty | Sí | `testBinaryTreeCreateEmpty` (`test/DataStructuresAdvancedTest.hx:101`) | Verifica `isEmpty`, `size == 0`, `contains(50) == false` |
| BinaryTree: Insertar la raíz / Insert the root | Sí | `testBinaryTreeInsertRoot` (`test/DataStructuresAdvancedTest.hx:108`) | Verifica tamaño 1 y pertenencia de 50 |
| BinaryTree: Insertar menor y mayor / Insert lower and higher | Sí | `testBinaryTreeInsertLowerAndHigher` (`test/DataStructuresAdvancedTest.hx:116`) | Inserta 50, 30, 70; verifica tamaño 3 y pertenencia |
| BinaryTree: Ramas de varios niveles / Multilevel branches | Sí | `testBinaryTreeMultilevelBranches` (`test/DataStructuresAdvancedTest.hx:125`) | Inserta 50, 30, 70, 20, 40; verifica tamaño 5 y pertenencia |
| BinaryTree: Valor ausente en árbol no vacío / Missing value in nonempty tree | Sí | `testBinaryTreeMissingValueInNonemptyTree` (`test/DataStructuresAdvancedTest.hx:134`) | `contains(99)` falla sin alterar tamaño ni estado |
| BinaryTree: Duplicado idempotente / Idempotent duplicate | Sí | `testBinaryTreeIdempotentDuplicate` (`test/DataStructuresAdvancedTest.hx:142`) | Inserta 30 repetido; éxito sin incrementar tamaño 3 |
| BinaryTree: Inserciones ordenadas / Ordered insertions | Sí | `testBinaryTreeOrderedInsertions` (`test/DataStructuresAdvancedTest.hx:151`) | Inserta 20, 30, 40, 50, 70; verifica tamaño 5 y pertenencia |
| Graph: Crear vacío / Create empty | Sí | `testGraphCreateEmpty` (`test/DataStructuresAdvancedTest.hx:165`) | `isEmpty`, contadores en 0, `hasEdge` y `getNeighbors` fallan |
| Graph: Vértice aislado / Isolated vertex | Sí | `testGraphIsolatedVertex` (`test/DataStructuresAdvancedTest.hx:173`) | 1 vértice, 0 aristas, vecinos vacíos `[]` |
| Graph: Etiquetas no consecutivas y arista dirigida / Nonconsecutive labels and directed edge | Sí | `testGraphNonconsecutiveLabelsDirectedEdge` (`test/DataStructuresAdvancedTest.hx:181`) | Arista (10, 70); verifica dirección única |
| Graph: Vértice duplicado conserva adyacencia / Duplicate vertex preserves adjacency | Sí | `testGraphDuplicateVertexPreservesAdjacency` (`test/DataStructuresAdvancedTest.hx:191`) | Re-insertar vértice 10 conserva adyacencia previa `[30]` |
| Graph: Arista duplicada / Duplicate edge | Sí | `testGraphDuplicateEdge` (`test/DataStructuresAdvancedTest.hx:201`) | Doble `addEdge(10,30)` es idempotente; 1 arista |
| Graph: Extremo inexistente sin mutación / Missing endpoint without mutation | Sí | `testGraphMissingEndpointWithoutMutation` (`test/DataStructuresAdvancedTest.hx:211`) | Cuatro fallos de extremos ausentes no mutan contadores ni adyacencias |
| Graph: Vecinos ordenados y contadores / Sorted neighbours and counts | Sí | `testGraphSortedNeighboursAndCounts` (`test/DataStructuresAdvancedTest.hx:231`) | Verifica orden `[30, 50, 70]` y contadores 4 vértices, 4 aristas |
| Graph: Consulta de arista ausente / Missing-edge query | Sí | `testGraphMissingEdgeQuery` (`test/DataStructuresAdvancedTest.hx:247`) | `hasEdge(10, 30) == false` sin alterar contadores |
| Graph: Vecinos de vértice inexistente / Neighbours of missing vertex | Sí | `testGraphNeighboursOfMissingVertex` (`test/DataStructuresAdvancedTest.hx:256`) | `getNeighbors(99) == null`, distinto de lista vacía `[]` |
| Graph: Bucle y duplicado / Self-loop and duplicate | Sí | `testGraphSelfLoopAndDuplicate` (`test/DataStructuresAdvancedTest.hx:264`) | Autociclo `(10, 10)` duplicado resulta en 1 arista y vecino `[10]` |
| Graph: Aislamiento del resultado de vecinos / Neighbour-result isolation | Sí | `testGraphNeighbourResultIsolation` (`test/DataStructuresAdvancedTest.hx:274`) | Modificar la copia devuelta o añadir nuevas aristas no corrompe resultados previos |

**ES:** Mapeo: `unidad/variante → casos aplicables → grupo lógico → archivo/suite → runner`. La suite unitaria `DataStructuresAdvancedTest` (ejecutada mediante `RunTests.hx` con utest) aísla cada escenario en una instancia nueva e independiente. Total: 23 pruebas, 162 aserciones.

**EN:** Mapping: `unit/variant → applicable cases → logical group → file/suite → runner`. The `DataStructuresAdvancedTest` unit suite (executed via `RunTests.hx` with utest) isolates each scenario in a fresh, independent instance. Total: 23 tests, 162 assertions.

---

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| Búsqueda de vértices en lista enlazada canónica `O(V)` / Vertex lookup in canonical linked list `O(V)` | En grafos con un volumen muy grande de vértices, la búsqueda lineal es más lenta que una tabla hash / In graphs with a very large vertex volume, linear search is slower than a hash table | Requisito pedagógico manual del módulo; fases posteriores abordan estructuras indexadas / Module's manual pedagogical requirement; later phases introduce indexed structures |
| Árbol binario sin balanceo / Unbalanced binary search tree | Secuencias de inserción ordenadas degradan la altura a `O(n)` / Ordered insertion sequences degrade tree height to `O(n)` | Cumple el contrato contractual de ABB básico; árboles balanceados (AVL / Red-Black) corresponden a módulos específicos / Meets the contractual basic BST specification; balanced trees belong to specific modules |

---

## 📝 Notas de implementación / Implementation Notes

**ES:** Las operaciones de `BinaryTree` y `Graph` son completamente iterativas (bucles `while`), por lo que la optimización de llamada de cola (TCO) no aplica en este módulo. La base `Node` utiliza herencia directa (`extends Node`) en `TreeNode` y `GraphNode`, donde `Node` solo almacena el valor y delega el manejo y validación de enlaces a los nodos hijos. `GraphNode` se define como clase privada dentro de `src/Graph.hx` restringida a `src.Graph` con `@:allow(src.Graph)`, preservando el encapsulamiento del ADT. La ordenación de vecinos se mantiene en tiempo de inserción en `O(d(u))`, devolviendo una copia superficial (`Array.copy()`) en `getNeighbors` para asegurar el aislamiento de las secuencias observadas.

**EN:** All operations across `BinaryTree` and `Graph` are fully iterative (`while` loops), so tail call optimization (TCO) does not apply in this module. The `Node` base uses direct inheritance (`extends Node`) in `TreeNode` and `GraphNode`, where `Node` holds only the value and leaves link management and validation to its child nodes. `GraphNode` is defined as a private class in `src/Graph.hx` restricted to `src.Graph` via `@:allow(src.Graph)`, maintaining the ADT's encapsulation. Neighbour ordering is maintained during insertion in `O(d(u))`, returning a shallow copy (`Array.copy()`) in `getNeighbors` to guarantee isolation of observed sequences.

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
| Especificación / Specification | [`07_Data_Structures_Advanced.md`](../../../../docs/core/algorithms/07_Data_Structures_Advanced.md) |
| Primera base del lenguaje / First language reference | [`haxe/core/algorithms/data_structures_basics/`](../data_structures_basics/) |
| Segunda base del lenguaje / Second language reference | [`haxe/core/foundations/numbers/`](../../foundations/numbers/) |
| Guía de inicialización / Initialisation guide | [`core/00_Project_Initialization_Guide.md`](../../../../docs/core/00_Project_Initialization_Guide.md) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](../../../../docs/AGENT_Template.md) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](../../../../docs/WORKFLOW.md) |
| Documentación oficial del lenguaje / Language official docs | [Haxe Manual](https://haxe.org/manual/) |

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
