//
//  LeeCode203.swift
//  LeeCode
//
//  Created by 王俊杰 on 2020/4/10.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa

/*
 删除链表中等于给定值 val 的所有节点。
 */
/*
 思路:头部添加哨兵节点
 */
class LeeCode203: NSObject {
    //迭代
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let pre = ListNode.init(0)
        pre.next = head
        var aa:ListNode? = pre
        while aa != nil {
            if aa!.next?.val == val{
                aa!.next = aa!.next?.next
            }
            else{
                aa = aa!.next
            }
        }
        return pre.next
    }
    //递归
    func removeElements12(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return head
        }
        head?.next = removeElements(head, val)
        if head?.val == val {
            return head?.next
        }
        else{
            return head
        }
    }
}
