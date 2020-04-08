//
//  LeeCode19.swift
//  LeeCode
//
//  Created by 王俊杰 on 2020/4/8.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa
/*
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

 示例：

 给定一个链表: 1->2->3->4->5, 和 n = 2.

 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：

 给定的 n 保证是有效的。

 进阶：

 你能尝试使用一趟扫描实现吗？

 链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
 */
class LeeCode19: NSObject {
    class func removeNthFromEndBetter(_ head: ListNode?, _ n: Int) -> ListNode? {
        let cur = ListNode.init(0)
        cur.next = head
        var node1:ListNode? = cur, node2:ListNode? = cur
        for _ in 0...n {
            node2 = node2?.next
        }
        while node2 != nil {
            node1 = node1?.next
            node2 = node2?.next
        }
        node1?.next = node1?.next?.next
        return cur.next
    }
    
/*----------------------------------------尝试--------------------------*/
    class func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var arr = [ListNode]()
        var pre = head
        var count = 0
        
        while pre != nil {
            arr.append(pre!)
            pre = pre?.next
            count += 1
        }
        
        if n == count {
            return pre?.next
        }
        else if n == 1 {
            let last = arr[count - 2]
            last.next = nil
            return pre
        }
        else{
            let last = arr[count - n - 1]
            let next = arr[count - n + 1]
            last.next = next
            return pre
        }
    }
}
