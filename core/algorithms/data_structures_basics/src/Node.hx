package src;

/**
 * Shared linked cell used by LinkedList, Stack and Queue.
 *
 * Contract stub (step 4b): the value is immutable after construction and the
 * link is mutable. `next` is the module's only nullable value; the cell is built
 * with `new Node(value)` (the contract's `init`) and its value and link are read
 * or written through the properties (`get_value`, `get_next`, `set_next`).
 */
final class Node {
    /** Value stored at construction time. Read-only. */
    public var value(default, null):Int;

    /** Link to the next node, or null when absent. */
    public var next(default, default):Null<Node>;

    public function new(value:Int) {
        this.value = value;
        this.next = null;
    }
}
