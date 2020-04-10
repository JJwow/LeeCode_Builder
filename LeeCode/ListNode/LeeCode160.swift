//
//  LeeCode160.swift
//  LeeCode
//
//  Created by 王俊杰 on 2020/4/10.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa

/*
 编写一个程序，找到两个单链表相交的起始节点。
 */
//思路:一张链表循环结束接着去循环另一张表,如果两者链表相交,两张链表头出发的两个点会在交点相遇
class LeeCode160: NSObject {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        var low = headA , fast = headB, bLow = false, bFast = false
        while low != nil && fast != nil {
            if gg(obj: low!) == gg(obj: fast!) {
                return low
            }
            if low?.next == nil && bLow == false {
                low = headB
                bLow = true
            }
            else{
                low = low?.next
            }
            if fast?.next == nil && bFast == false {
                fast = headA
                bFast = true
            }
            else{
                fast = fast?.next
            }
        }
        return low
    }
    //获取没有继承NSObject的类的内存地址
    func gg(obj:AnyObject) -> String {
        return String(describing: Unmanaged<AnyObject>.passUnretained(obj).toOpaque())
    }
}
