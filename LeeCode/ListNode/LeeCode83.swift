//
//  LeeCode83.swift
//  LeeCode
//
//  Created by fly on 2020/4/9.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa

class LeeCode83: NSObject {
    class func deleteDuplicatesBetter(_ head: ListNode?) -> ListNode? {
        var pre = head
        while pre != nil && pre?.next != nil {
            if pre?.val == pre?.next?.val {
                pre?.next = pre?.next?.next
            }
            else{
                pre = pre?.next
            }
        }
        return head
    }
    //链表是否有序都可以用
    class func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var dic = [Int:ListNode]()
        let cur = ListNode.init(0)
        cur.next = head
        var pre = cur.next, now = cur.next
        while pre != nil {
            if dic[pre!.val] == nil {
                dic[pre!.val] = pre
                now = pre
            }
            else{
                now?.next = pre?.next
            }
            pre = pre?.next
        }
        
        return cur.next
    }
}

