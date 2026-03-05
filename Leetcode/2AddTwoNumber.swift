/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */


public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var head1 = l1
        var head2 = l2
        var currentNode = dummy
        var carry = 0
        while(head1 !=  nil || head2 != nil || carry != 0){
            let val1 = (head1 != nil) ? head1!.val : 0
            let val2 = (head2 != nil) ? head2!.val : 0
            let sum = val1 + val2 + carry
            if(sum/10 != 0){
                carry = 1
            }else{
                carry = 0
            }
            let node = ListNode(sum%10)
            currentNode.next = node
            currentNode = node
            if (head1 != nil) {head1=head1!.next}
            if (head2 != nil) {head2=head2!.next}
        }
        return dummy.next
    }
}

func getNumber(_ l:ListNode?)->Int{
        if let node = l{
            var currentNode:ListNode? = node
            var currentScale = 10
            var finalNumber = currentNode!.val
            if currentNode!.next == nil {
                return finalNumber
            }
            repeat{
                currentNode = currentNode!.next
                finalNumber += (currentNode!.val*currentScale)
                currentScale *= 10
            }while(currentNode!.next != nil)
            print(finalNumber)
            return finalNumber
        }
        return 0
}





var endNode = ListNode(2)
var middleNode = ListNode(4,endNode)
var startNode = ListNode(3,middleNode)

var endNode2 = ListNode(5)
var startNode2 = ListNode(4,endNode2)

print(getNumber(Solution.addTwoNumbers(startNode, startNode2)))