package src;

@:allow(src.Graph)
private class GraphNode extends Node {

    public var neighbors:Array<Int>;
    public var nextVertex:Null<GraphNode>;
    public function new(label:Int) {
        super(label);
        this.neighbors = [];
        this.nextVertex = null;
    }
}

final class Graph {

    private var _vertices:Null<GraphNode>;
    private var _vertexCount:Int;
    private var _edgeCount:Int;

    public function new() {
        this._vertices = null;
        this._vertexCount = 0;
        this._edgeCount = 0;
    }

    private function findVertex(label:Int):Null<GraphNode> {
        var current = this._vertices;
        while (current != null) {
            if (current.value == label) return current;
            current = current.nextVertex;
        }
        return null;
    }

    // Sorted insertion without duplicates.
    private function insertNeighbor(neighbors:Array<Int>, label:Int):Void {
        var index = 0;
        while (index < neighbors.length && neighbors[index] < label) index++;
        neighbors.insert(index, label);
    }

    public function addVertex(label:Int):Bool {
        if (this.findVertex(label) != null) return true;
        var vertex = new GraphNode(label);
        vertex.nextVertex = this._vertices;
        this._vertices = vertex;
        this._vertexCount++;
        return true;
    }

    public function addEdge(u:Int, v:Int):Bool {
        var vertexU = this.findVertex(u);
        if (vertexU == null || this.findVertex(v) == null) return false;
        if (vertexU.neighbors.indexOf(v) != -1) return true;
        this.insertNeighbor(vertexU.neighbors, v);
        this._edgeCount++;
        return true;
    }

    public function hasEdge(u:Int, v:Int):Bool {
        var vertexU = this.findVertex(u);
        return vertexU != null && vertexU.neighbors.indexOf(v) != -1;
    }

    public function getNeighbors(u:Int):Null<Array<Int>> {
        var vertexU = this.findVertex(u);
        if (vertexU == null) return null;
        return vertexU.neighbors.copy();
    }

    public var isEmpty(get, never):Bool;
    private function get_isEmpty():Bool {
        return this._vertexCount == 0;
    }

    public var vertexCount(get, never):Int;
    private function get_vertexCount():Int {
        return this._vertexCount;
    }

    public var edgeCount(get, never):Int;
    private function get_edgeCount():Int {
        return this._edgeCount;
    }
}
