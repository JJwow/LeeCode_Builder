//
//  LeeCode445.swift
//  LeeCode
//
//  Created by fly on 2020/4/16.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa

class LeeCode445: NSObject {
    class func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1, list2 = l2, arr1 = [ListNode](), arr2 = [ListNode]()
        while list1 != nil {
            arr1.append(list1!)
            list1 = list1?.next
        }
        while list2 != nil {
            arr2.append(list2!)
            list2 = list2?.next
        }
        var carry = 0, result:ListNode?
        
        while arr1.count != 0 || arr2.count != 0 {
            if arr1.count == 0 {
                if carry != 0 {
                    arr1.append(ListNode.init(carry))
                    carry = 0
                }
                else{
                    arr2.last?.next = result
                    return l2
                }
            }
            else if arr2.count == 0{
                if carry != 0 {
                    arr2.append(ListNode.init(carry))
                    carry = 0
                }
                else{
                    arr1.last?.next = result
                    return l1
                }
            }
            let sum = ((arr1.last!.val) + (arr2.last!.val))%10
            let rr = ListNode.init(sum + carry)
            carry = ((arr1.last!.val) + (arr2.last!.val))/10
            rr.next = result
            result = rr
            _ = arr1.popLast()
            _ = arr2.popLast()
        }
        if carry != 0{
            let rr = ListNode.init(carry)
            rr.next = result
            result = rr
        }
        return result
    }
}
