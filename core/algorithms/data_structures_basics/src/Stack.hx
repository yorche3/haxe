package src;

/**
 * LIFO stack built from scratch over Node.
 *
 * Contract stub (step 4b): every body stays at its failure indicator - -1 for
 * numbers and false for flags -, and no `null` is used outside the Node links.
 *
 * The default constructor yields an empty stack: `new Stack()` is the contract's
 * `init`.
 */
final class Stack {
    private var top:Null<Node>;
    private var count:Int;

    public function new() {
        this.top = null;
        this.count = 0;
    }

    /** Top value, or -1 when the stack is empty (peek). */
    public var topValue(get, never):Int;
    inline function get_topValue():Int {
        return -1;
    }

    /** True when the stack contains no nodes (is_empty). */
    public var isEmpty(get, never):Bool;
    inline function get_isEmpty():Bool {
        return false;
    }

    /** Number of nodes currently stored (size). */
    public var size(get, never):Int;
    inline function get_size():Int {
        return 0;
    }

    /** Pushes value on top of the stack (push). */
    public function push(value:Int):Void {
    }

    /** Removes and returns the top value, or -1 when empty (pop). */
    public function pop():Int {
        return -1;
    }
}
