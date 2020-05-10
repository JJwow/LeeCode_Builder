//
//  LeeCode725.swift
//  LeeCode
//
//  Created by fly on 2020/4/19.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa

class LeeCode725: NSObject {
    /*
     思路：
     1、循环k次，初始化k个链表
     2、初始化一个HashMap用于存放链表的下标和对应链表的尾节点
     3、遍历传进来的链表，根据一个递增的下标，将链表的节点分别放入我们准备好的链表数组中
     4、遍历链表数组，将每个链表都等与其子节点（因为在第一步中，我们初始化了一个初始节点，在最后需要去除初始节点）
     */
    class func splitListToParts(_ root: ListNode?, _ k: Int) -> [ListNode?] {
        var nodeList = [ListNode?](), nodeMap = [Int:ListNode](), nodeIndex = 0, pre = root
        for index in 0..<k {
            let node = ListNode.init(0)
            nodeList.append(node)
            nodeMap[index] = node
        }
        while pre != nil {
            var node = nodeMap[nodeIndex]
            node!.next = pre
            node = node?.next
            pre = pre?.next
            node?.next = nil
            nodeMap[nodeIndex] = node
            if nodeIndex >= k - 1  {
                nodeIndex = 0
            }
            else{
               nodeIndex += 1
            }
        }
        for index in 0..<k {
            nodeList[index] = nodeList[index]?.next
            if nodeMap[nodeIndex] != nil {
                nodeMap[nodeIndex]?.next = nil
            }
        }
        return nodeList
    }
    class func splitListToPartsBetter(_ root: ListNode?, _ k: Int) -> [ListNode?] {
        var nodeList = [ListNode?](), nodeMap = [Int:ListNode](), nodeIndex = 0, pre = root
        for index in 0..<k {
            let node = ListNode.init(0)
            node.next = root
            nodeList.append(node)
            nodeMap[index] = node
        }
        while pre != nil {
            var node = nodeMap[nodeIndex]
            node = node?.next
            pre = pre?.next
            if nodeIndex >= k - 1  {
                nodeIndex = 0
            }
            else{
               nodeIndex += 1
            }
        }
        for index in 0..<k {
            nodeList[index] = nodeList[index]?.next
            if nodeMap[nodeIndex] != nil {
                nodeMap[nodeIndex]?.next = nil
            }
        }
        return nodeList
    }
}
