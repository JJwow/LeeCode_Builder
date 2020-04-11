//
//  main.swift
//  LeeCode
//
//  Created by fly on 2020/4/7.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Foundation

print("Hello, World!")

var node = ListNode.init(1)
node.next = ListNode.init(1)
node.next?.next = ListNode.init(1)
node.next?.next?.next = ListNode.init(3)
node.next?.next?.next?.next = ListNode.init(3)
var n = LeeCode83.deleteDuplicates(node)
while n != nil {
    print(n?.val)
    n = n?.next
}
