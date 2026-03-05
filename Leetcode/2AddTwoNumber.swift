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
        var num1 = getNumber(l1)
        var num2 = getNumber(l2)
    
        var sum = String(String(num1+num2).reversed())
        var lastNode = ListNode(Int(String(sum[sum.count-1]))!)
        for i in (0..<sum.count-1).reversed(){
            let node = ListNode(Int(String(sum[i]))!, lastNode)
            lastNode = node
        }
        return lastNode
    }

    static func getNumber(_ l:ListNode?)->Int{
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
}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}



var endNode = ListNode(2)
var middleNode = ListNode(4,endNode)
var startNode = ListNode(3,middleNode)

var endNode2 = ListNode(5)
var middleNode2 = ListNode(6,endNode2)
var startNode2 = ListNode(4,middleNode2)

print(Solution.getNumber(Solution.addTwoNumbers(startNode, startNode2)))