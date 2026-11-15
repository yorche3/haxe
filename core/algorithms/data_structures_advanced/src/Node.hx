package src;

class Node {
    public var value(get, never):Int;
    private var _value:Int;

    private function new(value:Int) {
        this._value = value;
    }

    private function get_value():Int {
        return this._value;
    }
}
