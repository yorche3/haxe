package src;

final class BinaryTree {
    public function new() {}

    public function insert(value:Int):Bool {
        return false;
    }

    public function contains(value:Int):Bool {
        return false;
    }

    public var isEmpty(get, never):Bool;
    private function get_isEmpty():Bool {
        return false;
    }

    public var size(get, never):Int;
    private function get_size():Int {
        return 0;
    }
}
