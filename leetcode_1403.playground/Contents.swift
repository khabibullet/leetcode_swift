// 1403. Minimum Subsequence in Non-Increasing Order

// Method 1 (Faster)
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

// Method 2

class Solution2 {
    func minSubsequence(_ nums: [Int]) -> [Int] {
        
        let seq = nums.sorted(by: { $0 >= $1 }).map { $0 }
        var res = [Int]()
        var seqSum = seq.reduce(0, +)
        var resSum = 0
        
        for num in seq {
            if (resSum > seqSum) {
                return res
            }
            res.append(num)
            seqSum -= num
        	resSum += num
        }
        return res
    }
}

var test = Solution2()

print(test.minSubsequence([4,3,10,9,8]))
