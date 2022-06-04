// 1403. Minimum Subsequence in Non-Increasing Order

class Solution {
    func minSubsequence(_ nums: [Int]) -> [Int] {
        
        var subSeq: [Int] = []
        var restSeq = nums.map { $0 }
        var subSeqSum: Int = 0
        var restSeqSum: Int = nums.reduce(0, +)
        var restSeqMax: Int
        
        while (subSeqSum <= restSeqSum) {
            restSeqMax = restSeq.remove(at : restSeq.firstIndex(of: restSeq.max()!)!)
            subSeq.append(restSeqMax)
            subSeqSum += restSeqMax
            restSeqSum -= restSeqMax
        }
        return subSeq.sorted(by: { $0 >= $1 })
    }
}

var test = Solution()

print(test.minSubsequence([1]))
