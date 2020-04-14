//
//  LeeCode328.swift
//  LeeCode
//
//  Created by fly on 2020/4/14.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa

/*
 给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。

 请尝试使用原地算法完成。你的算法的空间复杂度应为 O(1)，时间复杂度应为 O(nodes)，nodes 为节点总数。

 示例 1:

 输入: 1->2->3->4->5->NULL
 输出: 1->3->5->2->4->NULL
 示例 2:

 输入: 2->1->3->5->6->4->7->NULL
 输出: 2->3->6->7->1->5->4->NULL
 说明:

 应当保持奇数节点和偶数节点的相对顺序。
 链表的第一个节点视为奇数节点，第二个节点视为偶数节点，以此类推。

 链接：https://leetcode-cn.com/problems/odd-even-linked-list
 */
class LeeCode328: NSObject {
    class func oddEvenListBetter(_ head: ListNode?) -> ListNode? {
        var pre = head, sigal = ListNode.init(0), double = ListNode.init(0), low:ListNode? = sigal, fast:ListNode? = double
        while pre != nil  {
            low?.next = pre
            low = low?.next
            fast?.next = low?.next
            fast = fast?.next
            pre = pre?.next?.next
        }
        low?.next = nil
        fast?.next = nil
        low?.next = double.next
        return sigal.next
    }
    class func oddEvenList(_ head: ListNode?) -> ListNode? {
        var pre = head, sigal = ListNode.init(0), double = ListNode.init(0), low:ListNode? = sigal, fast:ListNode? = double, bSigal = true
        while pre != nil {
            if bSigal == true {
                low?.next = pre
                low = low?.next
                bSigal = false
            }
            else{
                fast?.next = pre
                fast = fast?.next
                bSigal = true
            }
            pre = pre?.next
        }
        low?.next = nil
        fast?.next = nil
        low?.next = double.next
        return sigal.next
    }
}
