package src;

private class GraphNode extends Node {
    public function new(label:Int) {
        super(label);
    }
}

final class Graph {
    public function new() {}

    public function addVertex(label:Int):Bool {
        return false;
    }

    public function addEdge(u:Int, v:Int):Bool {
        return false;
    }

    public function hasEdge(u:Int, v:Int):Bool {
        return false;
    }

    public function getNeighbors(u:Int):Null<Array<Int>> {
        return null;
    }

    public var isEmpty(get, never):Bool;
    private function get_isEmpty():Bool {
        return false;
    }

    public var vertexCount(get, never):Int;
    private function get_vertexCount():Int {
        return 0;
    }

    public var edgeCount(get, never):Int;
    private function get_edgeCount():Int {
        return 0;
    }
}
