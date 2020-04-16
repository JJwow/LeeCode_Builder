//
//  LeeCode141.swift
//  LeeCode
//
//  Created by fly on 2020/4/9.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa
/*
 给定一个链表，判断链表中是否有环。
 链接：https://leetcode-cn.com/problems/linked-list-cycle/
 */
class LeeCode141: NSObject {
    func hasCycle(_ head: ListNode?) -> Bool {
        var p1 = head, p2 = head
        while p2 != nil && p2?.next != nil {
            p1 = p1?.next
            p2 = p2?.next?.next
            if p1?.val == p2?.val{
                return true
            }
        }
        return false
    }
}
