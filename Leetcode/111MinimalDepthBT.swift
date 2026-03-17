  // 11. Minimal depth of BT ~ easy
  
  public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
         self.right = right
    }
}


class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        if let node = root{
            return BFS(node, 1)
        }
        return 0
        
    }

    func BFS(_ node:TreeNode?, _ level:Int) -> Int{
        if (node!.right == nil) && (node!.left == nil){
            return level
        }
        if  node!.right == nil{
            return BFS(node!.left, level+1)
        }else if  node!.left == nil{
            return BFS(node!.right, level+1)
        }else{
            let left = BFS(node!.left, level+1)
            let right = BFS(node!.right, level+1)
            //print(" \(left) vs \(right)")
            return left<right ? left : right
        }
    }
}