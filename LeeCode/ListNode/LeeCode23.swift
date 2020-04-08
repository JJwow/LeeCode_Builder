//
//  LeeCode23.swift
//  LeeCode
//
//  Created by 王俊杰 on 2020/4/8.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa

/*
 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。

 示例:

 输入:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 输出: 1->1->2->3->4->4->5->6

 链接：https://leetcode-cn.com/problems/merge-k-sorted-lists
 
 */



class LeeCode23: NSObject {
    class func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 || lists.isEmpty {
            return nil
        }
        return mergeList(lists, 0, lists.count - 1)
    }
    //对链表数组进行分治,最终进行最小的俩俩链表进行合并
    class func mergeList(_ list:[ListNode?],_ left:Int,_ right:Int) ->ListNode? {
        if left == right {
            return list[left]
        }
        let mid:Int = left + (right - left) / 2
        let l1:ListNode? = mergeList(list, left, mid)
        let l2:ListNode? = mergeList(list, mid + 1, right)
        return merge(l1,l2)
    }
    //两有序链表快速有序合并
    class func merge(_ l1:ListNode?, _ l2:ListNode?) -> ListNode?{
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        if l1!.val <= l2!.val {
            l1?.next = merge(l1?.next, l2)
            return l1
        }
        else{
            l2?.next = merge(l2?.next, l1)
            return l2
        }
    }
}
