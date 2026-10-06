package src;

/**
 * FIFO queue built from scratch over Node.
 *
 * Contract stub (step 4b): every body stays at its failure indicator - -1 for
 * numbers and false for flags -, and no `null` is used outside the Node links.
 *
 * The default constructor yields an empty queue: `new Queue()` is the contract's
 * `init`.
 */
final class Queue {
    private var front:Null<Node>;
    private var rear:Null<Node>;
    private var count:Int;

    public function new() {
        this.front = null;
        this.rear = null;
        this.count = 0;
    }

    /** Front value, or -1 when the queue is empty (peek). */
    public var frontValue(get, never):Int;
    inline function get_frontValue():Int {
        return -1;
    }

    /** True when the queue contains no nodes (is_empty). */
    public var isEmpty(get, never):Bool;
    inline function get_isEmpty():Bool {
        return false;
    }

    /** Number of nodes currently stored (size). */
    public var size(get, never):Int;
    inline function get_size():Int {
        return 0;
    }

    /** Adds value at the rear of the queue (enqueue). */
    public function enqueue(value:Int):Void {
    }

    /** Removes and returns the front value, or -1 when empty (dequeue). */
    public function dequeue():Int {
        return -1;
    }
}
