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
        return this.head != null ? this.head.value : -1;
    }

    /** True when the list contains no nodes (is_empty). */
    public var isEmpty(get, never):Bool;
    inline function get_isEmpty():Bool {
        return this.head == null;
    }

    /** Number of nodes currently stored (size). */
    public var size(get, never):Int;
    inline function get_size():Int {
        return this.count;
    }

    /** Inserts value at the head (insert_head). */
    public function insertHead(value:Int):Void {
        var newNode = new Node(value);
        newNode.next = this.head;
        this.head = newNode;
        if (this.tail == null) {
            this.tail = newNode;
        }
        this.count++;
    }

    /** Inserts value at the tail (insert_tail). */
    public function insertTail(value:Int):Void {
        var newNode = new Node(value);
        if (this.tail != null) {
            this.tail.next = newNode;
        }
        this.tail = newNode;
        if (this.head == null) {
            this.head = newNode;
        }
        this.count++;
    }

    /** Removes the first occurrence of value (delete); false when it is absent. */
    public function delete(value:Int):Bool {
        var current = this.head;
        var previous:Null<Node> = null;
        while (current != null) {
            if (current.value == value) {
                if (previous == null) {
                    this.head = current.next;
                } else {
                    previous.next = current.next;
                }
                if (current.next == null) {
                    this.tail = previous;
                }
                this.count--;
                return true;
            }
            previous = current;
            current = current.next;
        }
        return false;
    }
}
