//
//  LeeCode24.swift
//  LeeCode
//
//  Created by 王俊杰 on 2020/4/9.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa

/*
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

  

 示例:

 给定 1->2->3->4, 你应该返回 2->1->4->3.

 链接：https://leetcode-cn.com/problems/swap-nodes-in-pairs
 */
class LeeCode24: NSObject {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var pre = head, bLeft = true, cache:ListNode?, node = ListNode.init(0), result = node
        while pre != nil {
            if bLeft {
                cache = pre
            }
            else{
                result.next = pre
                result = result.next!
                result.next = cache
                result = result.next!
            }
            pre = pre?.next
        }
        if cache != nil {
            result.next = cache
        }
        return node.next
    }
    
}
