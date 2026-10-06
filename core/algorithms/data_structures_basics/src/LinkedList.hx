package src;

/**
 * Singly linked list built from scratch over Node.
 *
 * Contract stub (step 4b): the algorithm is written in step 5, so every body
 * stays at its failure indicator - -1 for numbers, false for flags and 0 for
 * counters -, and no `null` is used outside the Node links.
 *
 * The default constructor yields an empty list: `new LinkedList()` is the
 * contract's `init`.
 */
final class LinkedList {
    private var head:Null<Node>;
    private var tail:Null<Node>;
    private var count:Int;

    public function new() {
        this.head = null;
        this.tail = null;
        this.count = 0;
    }

    /** Head value, or -1 when the list is empty (get_head). */
    public var headValue(get, never):Int;
    inline function get_headValue():Int {
        return -1;
    }

    /** True when the list contains no nodes (is_empty). */
    public var isEmpty(get, never):Bool;
    inline function get_isEmpty():Bool {
        return false;
    }

    /** Number of nodes currently stored (size). */
    public var size(get, never):Int;
    inline function get_size():Int {
        return 0;
    }

    /** Inserts value at the head (insert_head). */
    public function insertHead(value:Int):Void {
    }

    /** Inserts value at the tail (insert_tail). */
    public function insertTail(value:Int):Void {
    }

    /** Removes the first occurrence of value (delete); false when it is absent. */
    public function delete(value:Int):Bool {
        return false;
    }
}
