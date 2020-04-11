//
//  LeeCode237.swift
//  LeeCode
//
//  Created by 王俊杰 on 2020/4/10.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa
/*
 请编写一个函数，使其可以删除某个链表中给定的（非末尾）节点，你将只被给定要求被删除的节点。
 */
class LeeCode237: NSObject {
    func deleteNode(_ node: ListNode?) {
        var pre = node
        pre?.val = (pre?.next!.val)!
        pre?.next = pre?.next?.next
    }
}
