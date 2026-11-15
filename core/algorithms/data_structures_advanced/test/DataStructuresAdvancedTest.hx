package test;

import utest.ITest;
import utest.Assert;
import src.TreeNode;
import src.BinaryTree;
import src.Graph;

/**
 * Unit tests for the DataStructuresAdvanced module using the utest framework.
 *
 * Tests cover all cases from the specification 07_Data_Structures_Advanced.md
 * (TreeNode: 5, BinaryTree: 7, Graph: 11). Each test uses a fresh instance.
 */
class DataStructuresAdvancedTest implements ITest {
    public function new() {}

    private function assertNeighbors(graph:Graph, vertex:Int, expected:Array<Int>, caseName:String):Void {
        var actual = graph.getNeighbors(vertex);
        Assert.notNull(actual, '$caseName: get_neighbors($vertex) should not fail');
        if (actual != null) {
            Assert.same(expected, actual, '$caseName: get_neighbors($vertex) should be $expected');
        }
    }

    private function valueOrMissing(node:Null<TreeNode>):Null<Int> {
        return node == null ? null : node.value;
    }

    private function assertCounts(graph:Graph, vertices:Int, edges:Int, caseName:String):Void {
        Assert.equals(vertices, graph.vertexCount, '$caseName: vertex_count should be $vertices');
        Assert.equals(edges, graph.edgeCount, '$caseName: edge_count should be $edges');
    }

    private function assertAllPresent(tree:BinaryTree, values:Array<Int>, caseName:String):Void {
        for (value in values) {
            Assert.isTrue(tree.contains(value), '$caseName: contains($value) should succeed');
        }
    }

    // ===========================================================================
    // TreeNode — 5 casos (el caso de adaptación inmutable no aplica: TreeNode es mutable)
    // ===========================================================================

    public function testTreeNodeCreate():Void {
        var node = new TreeNode(10);
        Assert.equals(10, node.value, "create tree node: get_value should be 10");
    }

    public function testTreeNodeAbsentInitialLinks():Void {
        var node = new TreeNode(10);
        Assert.isNull(node.left, "absent initial links: get_left should be absent");
        Assert.isNull(node.right, "absent initial links: get_right should be absent");
    }

    public function testTreeNodeLinkTwoChildren():Void {
        var parent = new TreeNode(10);
        parent.left = new TreeNode(20);
        parent.right = new TreeNode(30);
        Assert.equals(20, valueOrMissing(parent.left), "link two children: get_value(get_left) should be 20");
        Assert.equals(30, valueOrMissing(parent.right), "link two children: get_value(get_right) should be 30");
    }

    public function testTreeNodeTraverseEachLink():Void {
        var parent = new TreeNode(10);
        parent.left = new TreeNode(20);
        parent.right = new TreeNode(30);
        var left = parent.left;
        var right = parent.right;
        Assert.notNull(left, "traverse each link: left child should be present");
        Assert.notNull(right, "traverse each link: right child should be present");
        Assert.equals(20, valueOrMissing(left), "traverse each link: left child should lead to 20");
        Assert.equals(30, valueOrMissing(right), "traverse each link: right child should lead to 30");
        Assert.isNull(left == null ? null : left.left, "traverse each link: left child's left should be absent");
        Assert.isNull(left == null ? null : left.right, "traverse each link: left child's right should be absent");
        Assert.isNull(right == null ? null : right.left, "traverse each link: right child's left should be absent");
        Assert.isNull(right == null ? null : right.right, "traverse each link: right child's right should be absent");
    }

    public function testTreeNodeUnlinkChildren():Void {
        var parent = new TreeNode(10);
        parent.left = new TreeNode(20);
        parent.right = new TreeNode(30);

        parent.left = null;
        Assert.isNull(parent.left, "unlink children: left should be absent after clearing it");
        Assert.equals(10, parent.value, "unlink children: value should stay 10 after clearing left");
        Assert.notNull(parent.right, "unlink children: right should be preserved after clearing left");
        Assert.equals(30, valueOrMissing(parent.right), "unlink children: right child should stay 30 after clearing left");

        parent.right = null;
        Assert.isNull(parent.left, "unlink children: left should be absent after clearing right");
        Assert.isNull(parent.right, "unlink children: right should be absent after clearing right");
        Assert.equals(10, parent.value, "unlink children: value should stay 10 after clearing right");
    }

    // ===========================================================================
    // BinaryTree — 7 casos
    // ===========================================================================

    public function testBinaryTreeCreateEmpty():Void {
        var tree = new BinaryTree();
        Assert.isTrue(tree.isEmpty, "create empty: is_empty should be true");
        Assert.equals(0, tree.size, "create empty: size should be 0");
        Assert.isFalse(tree.contains(50), "create empty: contains(50) should fail");
    }

    public function testBinaryTreeInsertRoot():Void {
        var tree = new BinaryTree();
        Assert.isTrue(tree.insert(50), "insert root: insert(50) should succeed");
        Assert.equals(1, tree.size, "insert root: size should be 1");
        Assert.isFalse(tree.isEmpty, "insert root: is_empty should be false");
        Assert.isTrue(tree.contains(50), "insert root: contains(50) should succeed");
    }

    public function testBinaryTreeInsertLowerAndHigher():Void {
        var tree = new BinaryTree();
        for (value in [50, 30, 70]) {
            Assert.isTrue(tree.insert(value), 'insert lower and higher: insert($value) should succeed');
        }
        Assert.equals(3, tree.size, "insert lower and higher: size should be 3");
        assertAllPresent(tree, [50, 30, 70], "insert lower and higher");
    }

    public function testBinaryTreeMultilevelBranches():Void {
        var tree = new BinaryTree();
        for (value in [50, 30, 70, 20, 40]) {
            Assert.isTrue(tree.insert(value), 'multilevel branches: insert($value) should succeed');
        }
        assertAllPresent(tree, [50, 30, 70, 20, 40], "multilevel branches");
        Assert.equals(5, tree.size, "multilevel branches: size should be 5");
    }

    public function testBinaryTreeMissingValueInNonemptyTree():Void {
        var tree = new BinaryTree();
        tree.insert(50);
        Assert.isFalse(tree.contains(99), "missing value: contains(99) should fail");
        Assert.equals(1, tree.size, "missing value: size should stay 1");
        Assert.isTrue(tree.contains(50), "missing value: contains(50) should still succeed");
    }

    public function testBinaryTreeIdempotentDuplicate():Void {
        var tree = new BinaryTree();
        for (value in [50, 30, 70, 30]) {
            Assert.isTrue(tree.insert(value), 'idempotent duplicate: insert($value) should succeed');
        }
        Assert.equals(3, tree.size, "idempotent duplicate: size should be 3");
        assertAllPresent(tree, [50, 30, 70], "idempotent duplicate");
    }

    public function testBinaryTreeOrderedInsertions():Void {
        var tree = new BinaryTree();
        for (value in [20, 30, 40, 50, 70]) {
            Assert.isTrue(tree.insert(value), 'ordered insertions: insert($value) should succeed');
        }
        Assert.equals(5, tree.size, "ordered insertions: size should be 5");
        assertAllPresent(tree, [20, 30, 40, 50, 70], "ordered insertions");
        Assert.isFalse(tree.contains(99), "ordered insertions: contains(99) should fail");
    }

    // ===========================================================================
    // Graph — 11 casos
    // ===========================================================================

    public function testGraphCreateEmpty():Void {
        var graph = new Graph();
        Assert.isTrue(graph.isEmpty, "create empty: is_empty should be true");
        assertCounts(graph, 0, 0, "create empty");
        Assert.isFalse(graph.hasEdge(10, 30), "create empty: has_edge(10,30) should fail");
        Assert.isNull(graph.getNeighbors(10), "create empty: get_neighbors(10) should fail");
    }

    public function testGraphIsolatedVertex():Void {
        var graph = new Graph();
        Assert.isTrue(graph.addVertex(10), "isolated vertex: add_vertex(10) should succeed");
        Assert.isFalse(graph.isEmpty, "isolated vertex: is_empty should be false");
        assertCounts(graph, 1, 0, "isolated vertex");
        assertNeighbors(graph, 10, [], "isolated vertex");
    }

    public function testGraphNonconsecutiveLabelsDirectedEdge():Void {
        var graph = new Graph();
        Assert.isTrue(graph.addVertex(10), "directed edge: add_vertex(10) should succeed");
        Assert.isTrue(graph.addVertex(70), "directed edge: add_vertex(70) should succeed");
        Assert.isTrue(graph.addEdge(10, 70), "directed edge: add_edge(10,70) should succeed");
        Assert.isTrue(graph.hasEdge(10, 70), "directed edge: has_edge(10,70) should succeed");
        Assert.isFalse(graph.hasEdge(70, 10), "directed edge: has_edge(70,10) should fail");
        assertCounts(graph, 2, 1, "directed edge");
    }

    public function testGraphDuplicateVertexPreservesAdjacency():Void {
        var graph = new Graph();
        Assert.isTrue(graph.addVertex(10), "duplicate vertex: add_vertex(10) should succeed");
        Assert.isTrue(graph.addVertex(30), "duplicate vertex: add_vertex(30) should succeed");
        Assert.isTrue(graph.addEdge(10, 30), "duplicate vertex: add_edge(10,30) should succeed");
        Assert.isTrue(graph.addVertex(10), "duplicate vertex: second add_vertex(10) should succeed");
        assertCounts(graph, 2, 1, "duplicate vertex");
        assertNeighbors(graph, 10, [30], "duplicate vertex");
    }

    public function testGraphDuplicateEdge():Void {
        var graph = new Graph();
        graph.addVertex(10);
        graph.addVertex(30);
        Assert.isTrue(graph.addEdge(10, 30), "duplicate edge: first add_edge(10,30) should succeed");
        Assert.isTrue(graph.addEdge(10, 30), "duplicate edge: second add_edge(10,30) should succeed");
        assertCounts(graph, 2, 1, "duplicate edge");
        assertNeighbors(graph, 10, [30], "duplicate edge");
    }

    public function testGraphMissingEndpointWithoutMutation():Void {
        var graph = new Graph();
        graph.addVertex(10);
        graph.addVertex(30);
        graph.addEdge(10, 30);
        Assert.isFalse(graph.addEdge(10, 99), "missing endpoint: add_edge(10,99) should fail");
        Assert.isFalse(graph.addEdge(99, 10), "missing endpoint: add_edge(99,10) should fail");
        Assert.isFalse(graph.addEdge(98, 99), "missing endpoint: add_edge(98,99) should fail");
        Assert.isFalse(graph.addEdge(99, 99), "missing endpoint: add_edge(99,99) should fail");
        assertCounts(graph, 2, 1, "missing endpoint");
        assertNeighbors(graph, 10, [30], "missing endpoint");
        assertNeighbors(graph, 30, [], "missing endpoint");
        Assert.isFalse(graph.hasEdge(10, 99), "missing endpoint: has_edge(10,99) should fail");
        Assert.isFalse(graph.hasEdge(99, 10), "missing endpoint: has_edge(99,10) should fail");
        Assert.isFalse(graph.hasEdge(98, 99), "missing endpoint: has_edge(98,99) should fail");
        Assert.isFalse(graph.hasEdge(99, 99), "missing endpoint: has_edge(99,99) should fail");
        Assert.isNull(graph.getNeighbors(98), "missing endpoint: get_neighbors(98) should fail");
        Assert.isNull(graph.getNeighbors(99), "missing endpoint: get_neighbors(99) should fail");
    }

    public function testGraphSortedNeighboursAndCounts():Void {
        var graph = new Graph();
        for (label in [10, 30, 50, 70]) {
            Assert.isTrue(graph.addVertex(label), 'sorted neighbours: add_vertex($label) should succeed');
        }
        Assert.isTrue(graph.addEdge(10, 70), "sorted neighbours: add_edge(10,70) should succeed");
        Assert.isTrue(graph.addEdge(10, 30), "sorted neighbours: add_edge(10,30) should succeed");
        Assert.isTrue(graph.addEdge(10, 50), "sorted neighbours: add_edge(10,50) should succeed");
        Assert.isTrue(graph.addEdge(30, 50), "sorted neighbours: add_edge(30,50) should succeed");
        assertNeighbors(graph, 10, [30, 50, 70], "sorted neighbours");
        assertNeighbors(graph, 30, [50], "sorted neighbours");
        assertNeighbors(graph, 50, [], "sorted neighbours");
        assertNeighbors(graph, 70, [], "sorted neighbours");
        assertCounts(graph, 4, 4, "sorted neighbours");
    }

    public function testGraphMissingEdgeQuery():Void {
        var graph = new Graph();
        graph.addVertex(10);
        graph.addVertex(30);
        Assert.isFalse(graph.hasEdge(10, 30), "missing-edge query: has_edge(10,30) should fail");
        assertCounts(graph, 2, 0, "missing-edge query");
        Assert.isFalse(graph.isEmpty, "missing-edge query: is_empty should be false");
    }

    public function testGraphNeighboursOfMissingVertex():Void {
        var graph = new Graph();
        graph.addVertex(10);
        Assert.isNull(graph.getNeighbors(99), "missing vertex: get_neighbors(99) should fail");
        assertNeighbors(graph, 10, [], "missing vertex");
        assertCounts(graph, 1, 0, "missing vertex");
    }

    public function testGraphSelfLoopAndDuplicate():Void {
        var graph = new Graph();
        graph.addVertex(10);
        Assert.isTrue(graph.addEdge(10, 10), "self-loop: first add_edge(10,10) should succeed");
        Assert.isTrue(graph.addEdge(10, 10), "self-loop: second add_edge(10,10) should succeed");
        Assert.isTrue(graph.hasEdge(10, 10), "self-loop: has_edge(10,10) should succeed");
        assertNeighbors(graph, 10, [10], "self-loop");
        assertCounts(graph, 1, 1, "self-loop");
    }

    public function testGraphNeighbourResultIsolation():Void {
        var graph = new Graph();
        for (label in [10, 30, 50]) {
            graph.addVertex(label);
        }
        graph.addEdge(10, 30);
        var saved = graph.getNeighbors(10);
        Assert.notNull(saved, "neighbour isolation: saved get_neighbors(10) should not fail");

        var copy = graph.getNeighbors(10);
        Assert.notNull(copy, "neighbour isolation: second get_neighbors(10) should not fail");
        if (copy != null) {
            copy.push(99);
        }
        assertNeighbors(graph, 10, [30], "neighbour isolation after changing copy");
        assertCounts(graph, 3, 1, "neighbour isolation after changing copy");

        Assert.isTrue(graph.addEdge(10, 50), "neighbour isolation: add_edge(10,50) should succeed");
        Assert.same([30], saved, "neighbour isolation: saved result should remain [30]");
        assertNeighbors(graph, 10, [30, 50], "neighbour isolation fresh query");
        assertCounts(graph, 3, 2, "neighbour isolation fresh query");
    }
}
