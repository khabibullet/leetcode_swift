// 21. Merge Two Sorted Lists

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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var tmpNodeNew: ListNode?
        var tmpNodePrev: ListNode?
        var newList: ListNode? = nil
        var tmpNode1 = list1
        var tmpNode2 = list2
        
        while (tmpNode1 != nil || tmpNode2 != nil) {
            if tmpNode2 == nil {
                tmpNodeNew = ListNode(tmpNode1!.val)
                tmpNode1 = tmpNode1!.next
            } else if tmpNode1 == nil {
                tmpNodeNew = ListNode(tmpNode2!.val)
                tmpNode2 = tmpNode2!.next
            } else {
                tmpNodeNew = ListNode(tmpNode1!.val < tmpNode2!.val ? tmpNode1!.val : tmpNode2!.val)
                if tmpNode1!.val < tmpNode2!.val {
                    tmpNode1 = tmpNode1!.next
                } else {
                    tmpNode2 = tmpNode2!.next
                }
            }
            if tmpNodePrev == nil {
                newList = tmpNodeNew
            } else {
                tmpNodePrev!.next = tmpNodeNew
            }
            tmpNodePrev = tmpNodeNew
        }
        return newList
    }
    
    func listToArray(_ list: ListNode?) -> [Int] {
        var    newArray: [Int] = []
        var    tmp: ListNode? = list

        tmp = list
        while tmp != nil {
            newArray.append(tmp!.val)
            tmp = tmp?.next
        }
        
        return newArray
    }
    
    func arrayToList(_ array: [Int]) -> ListNode? {
        let list: ListNode?

        if array.count == 0 {
            return nil
        }
        list = ListNode(array[0])
        var    tmp: ListNode? = list
        for num in array[1...] {
            tmp!.next = ListNode(num)
            tmp = tmp!.next
        }
        return list
    }
}


var newItem = Solution()
let list1 = newItem.arrayToList([1, 2, 4])
let list2 = newItem.arrayToList([1, 3, 4])

let newList = newItem.mergeTwoLists(list1, list2)
let arr = newItem.listToArray(newList)



