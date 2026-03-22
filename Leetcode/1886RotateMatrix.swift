// 1886 Rotate Matrix ~ easy

class Solution {
    func findRotation(_ mat: [[Int]], _ target: [[Int]]) -> Bool {
        var rotExist = false
        var copy = mat
        for i in 0..<4{
            self.rotate(&copy)
            print(copy)
            rotExist = rotExist || self.check(copy, target)
        }
        return rotExist
    }

    func check(_ mat: [[Int]], _ target: [[Int]])->Bool{
        var same = true
         for i in 0..<mat.count{
            for j in 0..<mat[i].count{
                if mat[i][j] != target[i][j]{
                    return false
                }
            }
        }
        return same
    }

    func rotate(_ mat: inout [[Int]]){
        for i in 0..<mat.count{
            for j in (i+1)..<mat[i].count{
                let helper = mat[i][j]
                mat[i][j] = mat[j][i]
                mat[j][i] = helper
            }
        }
        for i in 0..<mat.count{
            mat[i] = mat[i].reversed()
        }
    }
}

print(Solution().findRotation([[0,1],[1,0]], [[1,0],[0,1]]))
// true