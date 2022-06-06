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
    
    // Method for merging two listst with memory allocation
    
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
    
    // Method for merging two lists w/o memory allocation
    
    func mergeTwoLists2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list2 == nil {
            return list1
        } else if list1 == nil {
            return list2
        }
        
        let head = list1!.val < list2!.val ? list1 : list2
        var currNode1 = head
        var currNode2 = list1!.val < list2!.val ? list2 : list1
        var tmpNode: ListNode?
        
        while currNode2 != nil {
            while currNode1!.next != nil && currNode2!.val >= currNode1!.next!.val {
            	currNode1 = currNode1!.next
            }
            tmpNode = currNode2!.next
            currNode2!.next = currNode1!.next
            currNode1!.next = currNode2
            currNode2 = tmpNode
        }
        return head
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
let list1 = newItem.arrayToList([6])
let list2 = newItem.arrayToList([4])

let newList = newItem.mergeTwoLists2(list1, list2)
let arr = newItem.listToArray(newList)



