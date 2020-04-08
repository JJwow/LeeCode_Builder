//
//  LeeCode2.swift
//  LeeCode
//
//  Created by 王俊杰 on 2020/4/8.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa

/*
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：

 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807

 链接：https://leetcode-cn.com/problems/add-two-numbers
 */
class LeeCode2: NSObject {
    class func addTwoNumbersBetter(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let pre = ListNode.init(0)
        var cur = pre
        var carry = 0
        var newL1 = l1, newL2 = l2
        
        while newL1 != nil || newL2 != nil {
            let x = newL1?.val ?? 0
            let y = newL2?.val ?? 0
            var sum = x + y + carry
            carry = sum / 10
            sum = sum % 10
            cur.next = ListNode.init(sum)
            cur = cur.next!
            if newL1 != nil {
                newL1 = newL1?.next
            }
            if newL2 != nil {
                newL2 = newL2?.next
            }
        }
        if carry == 1 {
            cur.next = ListNode.init(carry)
        }
        return pre.next
        }
    
/*----------------------------------------尝试--------------------------*/
    class func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l11 = l1, l22 = l2
        //表1 + 表2,直到表1或表2是空
        while l11 != nil || l22 != nil {
            if l11 != nil && l22 != nil {//2节点都不为空
                //确保再一次循环前表1节点不比表2少
                if l11?.next == nil && l22?.next != nil {
                    let zeroNode = ListNode.init(0)
                    l11?.next = zeroNode
                }
                //计算和
                let max = (l11?.val ?? 0) + (l22?.val ?? 0)
                //余数给当前
                l11?.val = max % 10
                //商大于1进行进位操作
                if max / 10 > 0 {
                    //进位前确保表1下个节点不为空
                    if l11?.next == nil {
                        let zeroNode = ListNode.init(0)
                        l11?.next = zeroNode
                    }
                    //进位递归
                    dd(l11?.next,max / 10)
                }
                //变为下个节点进行循环
                l11 = l11?.next
                l22 = l22?.next
            }
            else if l22 == nil {
                //表2循环结束跳出循环
                break
            }
        }
        return l1
    }
    //进位递归方法
     class func dd(_ l11: ListNode?, _ fix: Int!) {
        let max = fix + (l11?.val ?? 0)
        l11?.val = max % 10
        if max / 10 > 0 {
            if l11?.next == nil {
                let zeroNode = ListNode.init(0)
                l11?.next = zeroNode
            }
            dd(l11?.next, max / 10)
        }
        return
    }
}
