class Solution{
    func stableMatching(_ preferencesMan:[Int: [Int]],_ preferencesWoman:[Int:[Int]])->[Int:Int]{
        // match (woman, man)
        var matchings:[Int:Int] = [:]
        var lastProposalMan:[Int:Int] = [:]
        var proposePool:[Int] = Array(preferencesMan.keys)
        let numOfWomen = Array(preferencesWoman.keys).count

        while proposePool.count != 0{
            let man = proposePool.popLast()!
            // go through every prefernce until not wed or wed to worse
            for i in lastProposalMan[man, default: 0]..<numOfWomen{
                let women = preferencesMan[man]![i]
                if !matchings.keys.contains(women){
                    matchings[women] = man
                    print("matched woman \(women) with \(man)")
                    lastProposalMan[man] = i
                    break
                }else if prefer(man, matchings[women]!, preferencesWoman[women]!){
                        proposePool.append(matchings[women]!)
                        matchings[women] = man
                         print("matched woman \(women) with \(man)")
                        lastProposalMan[man] = i
                        break
                }
            }
        }
        return matchings
    }

    private func prefer(_ new:Int,_ against:Int,  _ preferences:[Int])-> Bool{
        for i in preferences{
            if i==new{
                return true
            }
            if i==against{
                return false
            }
        }
        return false
    }
}

// var preferencesMan: [Int: [Int]] = [:]
// preferencesMan[0] = [5, 4, 6, 7]
// preferencesMan[1] = [4, 6, 5, 7]
// preferencesMan[2] = [4, 5, 7, 6]
// preferencesMan[3] = [6, 7, 4, 5]

// var preferencesWoman: [Int: [Int]] = [:]
// preferencesWoman[4] = [3, 0, 2, 1]
// preferencesWoman[5] = [0, 1, 2, 3]
// preferencesWoman[6] = [1, 3, 0, 2]
// preferencesWoman[7] = [2, 0, 3, 1]


var preferencesMan: [Int: [Int]] = [:]
preferencesMan[0] = [7, 5, 6, 4]
preferencesMan[1] = [5, 4, 6, 7]
preferencesMan[2] = [4, 5, 6, 7]
preferencesMan[3] = [4, 5, 6, 7]

var preferencesWoman: [Int: [Int]] = [:]
preferencesWoman[4] = [0, 1, 2, 3]
preferencesWoman[5] = [0, 1, 2, 3]
preferencesWoman[6] = [0, 1, 2, 3]
preferencesWoman[7] = [0, 1, 2, 3]

let solution = Solution()
print(solution.stableMatching(preferencesMan, preferencesWoman))