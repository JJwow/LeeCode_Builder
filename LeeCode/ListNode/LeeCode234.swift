//
//  LeeCode234.swift
//  LeeCode
//
//  Created by 王俊杰 on 2020/4/10.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa
/*
 请判断一个链表是否为回文链表。
 */
/*
 思路:快指针步长为2,慢指针步长为1,快指针为nil说明慢指针到达了中间,一边遍历一遍为慢指针经过的节点进行反转,根据快指针next是否为空判断链表的q奇偶性,再对l慢指针的子列表和剩余列表进行对比,是否有不同,判断是否为回文链表
 */
class LeeCode234: NSObject {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var fast = head, low = head, left:ListNode?, right = head, bS = false
        while fast != nil {
            if fast?.next == nil {
                bS = true
            }
            fast = fast?.next?.next
            right = low
            low = low?.next
            right?.next = left
            left = right
        }
        if bS == true {
            left = left?.next
        }
        while left != nil {
            if left?.val != low?.val {
                return false
            }
            left = left?.next
            low = low?.next
        }
        return true
    }
}
