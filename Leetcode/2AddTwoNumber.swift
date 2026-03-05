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
        guard let start1 = l1 else{
            if l2 != nil{
                return l2
            }
            return nil
        }
        guard let start2 = l2 else{
            return start1
        }
        var carry = 0
        var head1:ListNode? = start1
        var head2:ListNode? = start2
        var lastNode:ListNode? = nil
        let sum1 = head1!.val+head2!.val+carry
        if ((sum1/10) != 0){
                carry = 1
        }else{
                carry = 0
        }
        let node1 = ListNode(sum1%10, lastNode)
        lastNode = node1
        repeat{
            head1 = head1!.next
            head2 = head2!.next
            if (head1==nil && head2==nil){
                break
            }
            if (head1==nil){
                lastNode = head2
                break
            }
            if head2==nil{
                lastNode = head1
                break
            }
            let sum = head1!.val+head2!.val+carry
            if ((sum/10) != 0){
                carry = 1
            }else{
                carry = 0
            }
            let node = ListNode(sum%10, lastNode)
            lastNode = node
        }while(head1!.next != nil || head2!.next != nil)
        
        return lastNode
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