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
        var list1 = l1, list2 = l2, arr1 = [Int](), arr2 = [Int]()
        while list1 != nil {
            arr1.append(list1!.val)
            list1 = list1?.next
        }
        while list2 != nil {
            arr2.append(list2!.val)
            list2 = list2?.next
        }
        var carry = 0, result:ListNode?, left = 0, right = 0
        
        while arr1.count != 0 || arr2.count != 0 || carry != 0 {
            if arr1.count == 0 {
                left = 0
            }
            else{
                left = arr1.last!
                _ = arr1.popLast()
            }
            if arr2.count == 0 {
                right = 0
            }
            else{
                right = arr2.last!
                _ = arr2.popLast()
            }
            let sum = (left + right + carry)%10
            let rr = ListNode.init(sum)
            carry = (left + right + carry)/10
            rr.next = result
            result = rr
        }
        
        return result
    }
}
