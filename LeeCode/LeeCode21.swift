//
//  LeeCode21.swift
//  LeeCode
//
//  Created by fly on 2020/4/7.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa

class LeeCode21: NSObject {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var left:ListNode? = l1, right:ListNode? = l2, result:ListNode = ListNode.init(0)
        let change = result
        
        while left != nil && right != nil {
            if left!.val <= right!.val{
                result.next = left
                result = result.next!
                left = left?.next
            }
            else{
                result.next = right
                result = result.next!
                right = right?.next
            }
        }
        while left != nil {
            result.next = left
            result = result.next!
            left = left?.next
        }
        while right != nil {
            result.next = right
            result = result.next!
            right = right?.next
        }
        return change.next
    }
    
    func mergeTwoLists11(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var left:ListNode? = l1, right:ListNode? = l2
        if left == nil {
            return l2
        }
        if right == nil {
            return l1
        }
        if left!.val < right!.val {
            left?.next = mergeTwoLists(left?.next, right)
            return left
        }
        else{
            right?.next = mergeTwoLists(left, right?.next)
            return right
        }
    }
}


