package src;

final class BinaryTree {

    private var _root:Null<TreeNode>;
    private var _count:Int;

    public function new() {
        this._root = null;
        this._count = 0;
    }

    public function insert(value:Int):Bool {
        if (this._root == null) {
            this._root = new TreeNode(value);
            this._count++;
            return true;
        }
        var current = this._root;
        while (true) {
            if (value == current.value) {
                return true;
            } else if (value < current.value) {
                if (current.left == null) {
                    current.left = new TreeNode(value);
                    this._count++;
                    return true;
                }
                current = current.left;
            } else {
                if (current.right == null) {
                    current.right = new TreeNode(value);
                    this._count++;
                    return true;
                }
                current = current.right;
            }
        }
    }

    public function contains(value:Int):Bool {
        var current = this._root;
        while (current != null) {
            if (value == current.value) {
                return true;
            }
            current = value < current.value ? current.left : current.right;
        }
        return false;
    }

    public var isEmpty(get, never):Bool;
    private function get_isEmpty():Bool {
        return this._count == 0;
    }

    public var size(get, never):Int;
    private function get_size():Int {
        return this._count;
    }
}
