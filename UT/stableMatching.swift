class Solution{
    func stableMatching(_ preferencesMan:[Int, [Int]],_ preferencesWoman:[Int, [Int]]){
        // match (man, woman)
        var matchings:[Int, Int]
        var proposePool:[Int] = preferencesMan.keys

    }
}

var preferencesMan: [Int: [Int]] = [:]
preferencesMan[0] = [1, 0, 2, 3]
preferencesMan[1] = [0, 2, 1, 3]
preferencesMan[2] = [0, 1, 3, 2]
preferencesMan[3] = [2, 3, 0, 1]

var preferencesWoman: [Int: [Int]] = [:]
preferencesWoman[0] = [3, 0, 2, 1]
preferencesWoman[1] = [0, 1, 2, 3]
preferencesWoman[2] = [1, 3, 0, 2]
preferencesWoman[3] = [2, 0, 3, 1]

let solution = Solution()
solution.stableMatching(preferencesMan, preferencesWoman)