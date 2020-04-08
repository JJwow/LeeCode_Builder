//
//  LeeCode21.swift
//  LeeCode
//
//  Created by fly on 2020/4/7.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa

/*
 将两个升序链表合并为一个新的升序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4

 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
 */
class LeeCode21: NSObject {
    
    //递归
    func mergeTwoListsBetter(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let left:ListNode? = l1, right:ListNode? = l2
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

    
/*----------------------------------------尝试--------------------------*/
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
    
    
}


