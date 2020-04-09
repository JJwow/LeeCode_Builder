//
//  LeeCode206.swift
//  LeeCode
//
//  Created by 王俊杰 on 2020/4/9.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa
/*
 反转一个单链表。

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？

 链接：https://leetcode-cn.com/problems/reverse-linked-list
 */
class LeeCode206: NSObject {
    class func reverseListBetter(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let pre = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return pre
    }
    class func reverseList(_ head: ListNode?) -> ListNode? {
        var pre = head, left:ListNode?, right = head
        while pre != nil {
            right = pre
            pre = pre?.next
            right?.next = left
            left = right
        }
        return left
    }
}
