//
//  LeeCode160.swift
//  LeeCode
//
//  Created by fly on 2020/4/9.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa

class LeeCode160: NSObject {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var head1 = headA
        
        while head1?.next != nil {
            head1 = head1?.next
        }
        head1?.next = headA
        
        var p1 = headB, p2 = headB
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
