package test;

import utest.ITest;
import utest.Assert;
import src.Node;
import src.LinkedList;
import src.Stack;
import src.Queue;

/**
 * Unit tests for the DataStructuresBasics module using the utest framework.
 *
 * Tests cover all cases from the specification 06_Data_Structures_Basics.md
 */
class DataStructuresBasicsTest implements ITest {
    public function new() {}

    // ===========================================================================
    // Node — 2 casos de la especificación
    // ===========================================================================

    public function testNodeInitializeAndObserve():Void {
        var a = new Node(10);
        Assert.equals(10, a.value, "node value should be 10");
        Assert.isNull(a.next, "node link should be absent");
    }

    public function testNodeLinkAndTraverse():Void {
        var a = new Node(10);
        var b = new Node(20);
        a.next = b;
        Assert.equals(20, a.next.value, "get_value(get_next(a)) should be 20");
        Assert.isNull(b.next, "the next of b should be absent");
    }

    // ===========================================================================
    // LinkedList — 5 pasos sobre la misma instancia
    // ===========================================================================

    public function testLinkedListEmptyState():Void {
        var list = new LinkedList();
        Assert.isTrue(list.isEmpty, "is_empty should return True");
        Assert.equals(0, list.size, "size should return 0");
        Assert.equals(-1, list.headValue, "get_head should return -1");
    }

    public function testLinkedListInsertAtBothEnds():Void {
        var list = new LinkedList();
        list.insertTail(10);
        list.insertTail(20);
        list.insertHead(5);
        list.insertTail(10);
        Assert.equals(4, list.size, "size should return 4");
        Assert.equals(5, list.headValue, "get_head should return 5");
    }

    public function testLinkedListDeleteFirstOccurrence():Void {
        var list = new LinkedList();
        list.insertTail(10);
        list.insertTail(20);
        list.insertHead(5);
        list.insertTail(10);
        var removed = list.delete(10);
        Assert.isTrue(removed, "delete(10) should report success");
        Assert.equals(5, list.headValue, "get_head should still return 5");
        Assert.equals(3, list.size, "size should return 3");
    }

    public function testLinkedListAbsentValue():Void {
        var list = new LinkedList();
        list.insertTail(10);
        list.insertTail(20);
        list.insertHead(5);
        var removed = list.delete(99);
        Assert.isFalse(removed, "delete(99) should report failure");
        Assert.equals(5, list.headValue, "get_head should not change (5)");
        Assert.equals(3, list.size, "size should not change (3)");
    }

    public function testLinkedListEmptyTheList():Void {
        var list = new LinkedList();
        list.insertTail(10);
        list.insertTail(20);
        list.insertHead(5);
        var removed5 = list.delete(5);
        var removed20 = list.delete(20);
        var removed10 = list.delete(10);
        Assert.isTrue(removed5, "delete(5) should report success");
        Assert.isTrue(removed20, "delete(20) should report success");
        Assert.isTrue(removed10, "delete(10) should report success");
        Assert.isTrue(list.isEmpty, "is_empty should return True");
        Assert.equals(0, list.size, "size should return 0");
        Assert.equals(-1, list.headValue, "get_head should return -1");
    }

    // ===========================================================================
    // Stack — 4 pasos sobre la misma instancia
    // ===========================================================================

    public function testStackEmptyStateAndFailedRemoval():Void {
        var stack = new Stack();
        Assert.isTrue(stack.isEmpty, "is_empty should return True");
        Assert.equals(0, stack.size, "size should return 0");
        Assert.equals(-1, stack.topValue, "peek should return -1");
        var popped = stack.pop();
        Assert.equals(-1, popped, "pop should return -1");
        Assert.isTrue(stack.isEmpty, "the stack should stay empty after the failed pop");
    }

    public function testStackLifoAndNonMutatingPeek():Void {
        var stack = new Stack();
        stack.push(10);
        stack.push(20);
        stack.push(30);
        Assert.equals(30, stack.topValue, "peek should return 30");
        Assert.equals(3, stack.size, "size should return 3");
    }

    public function testStackRemovalAndReuse():Void {
        var stack = new Stack();
        stack.push(10);
        stack.push(20);
        stack.push(30);
        var first = stack.pop();
        stack.push(40);
        var second = stack.pop();
        var third = stack.pop();
        var fourth = stack.pop();
        Assert.equals(30, first, "the first pop should return 30");
        Assert.equals(40, second, "the second pop should return 40");
        Assert.equals(20, third, "the third pop should return 20");
        Assert.equals(10, fourth, "the fourth pop should return 10");
        Assert.isTrue(stack.isEmpty, "is_empty should return True");
        Assert.equals(0, stack.size, "size should return 0");
    }

    public function testStackEmptyAfterRemoval():Void {
        var stack = new Stack();
        stack.pop(); // empty
        var popped = stack.pop();
        Assert.equals(-1, popped, "pop should return -1");
        Assert.isTrue(stack.isEmpty, "is_empty should stay True");
    }

    // ===========================================================================
    // Queue — 4 pasos sobre la misma instancia
    // ===========================================================================

    public function testQueueEmptyStateAndFailedRemoval():Void {
        var queue = new Queue();
        Assert.isTrue(queue.isEmpty, "is_empty should return True");
        Assert.equals(0, queue.size, "size should return 0");
        Assert.equals(-1, queue.frontValue, "peek should return -1");
        var dequeued = queue.dequeue();
        Assert.equals(-1, dequeued, "dequeue should return -1");
        Assert.isTrue(queue.isEmpty, "the queue should stay empty after the failed dequeue");
    }

    public function testQueueFifoAndNonMutatingPeek():Void {
        var queue = new Queue();
        queue.enqueue(10);
        queue.enqueue(20);
        queue.enqueue(30);
        Assert.equals(10, queue.frontValue, "peek should return 10");
        Assert.equals(3, queue.size, "size should return 3");
    }

    public function testQueueRemovalAndReuse():Void {
        var queue = new Queue();
        queue.enqueue(10);
        queue.enqueue(20);
        queue.enqueue(30);
        var first = queue.dequeue();
        queue.enqueue(40);
        var second = queue.dequeue();
        var third = queue.dequeue();
        var fourth = queue.dequeue();
        Assert.equals(10, first, "the first dequeue should return 10");
        Assert.equals(20, second, "the second dequeue should return 20");
        Assert.equals(30, third, "the third dequeue should return 30");
        Assert.equals(40, fourth, "the fourth dequeue should return 40");
        Assert.isTrue(queue.isEmpty, "is_empty should return True");
        Assert.equals(0, queue.size, "size should return 0");
    }

    public function testQueueEmptyAfterRemoval():Void {
        var queue = new Queue();
        queue.dequeue(); // empty
        var dequeued = queue.dequeue();
        Assert.equals(-1, dequeued, "dequeue should return -1");
        Assert.isTrue(queue.isEmpty, "is_empty should stay True");
    }
}

