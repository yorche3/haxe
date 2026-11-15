package src;

final class TreeNode extends Node {
    public var left(get, set):Null<TreeNode>;
    public var right(get, set):Null<TreeNode>;

    private var _left:Null<TreeNode>;
    private var _right:Null<TreeNode>;

    public function new(value:Int) {
        super(value);
        _left = null;
        _right = null;
    }

    private function get_left():Null<TreeNode> {
        return this._left;
    }

    private function get_right():Null<TreeNode> {
        return this._right;
    }

    private function set_left(node:Null<TreeNode>):Null<TreeNode> {
        this._left = node;
        return this._left;
    }

    private function set_right(node:Null<TreeNode>):Null<TreeNode> {
        this._right = node;
        return this._right;
    }
}
