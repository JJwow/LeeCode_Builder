//
//  LeeCode146.swift
//  LeeCode
//
//  Created by 王俊杰 on 2020/4/8.
//  Copyright © 2020 JJWOW. All rights reserved.
//

import Cocoa
/*
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。

 获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
 写入数据 put(key, value) - 如果密钥已经存在，则变更其数据值；如果密钥不存在，则插入该组「密钥/数据值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。

  

 进阶:

 你是否可以在 O(1) 时间复杂度内完成这两种操作？

 链接：https://leetcode-cn.com/problems/lru-cache
 */
class LeeCode146: NSObject {
    var capacity = 0//容量
    var usedCapacity = 0//已使用的容量
    var headP:LinkNode?//头指针
    var guardP:LinkNode?//哨兵指针
    var cacheDic = [String:AnyObject]()//存放映射的hashMap为了能准确的寻找到双向链表的位置
    
    
    init(_ capacity: Int){
        self.capacity = capacity//初始化容量
    }
    func get(_ key: Int) -> Int{
        var node:LinkNode?
        if let value = cacheDic[String(key)] {//在hashMap中找到本次访问对象的指针
            node = (value as! LinkNode)
        }
        else{//不存在直接返回-1
            return -1
        }
        if node == headP && node != guardP {
            node!.childNode!.parentNode = nil;
            headP = node!.childNode
            node!.parentNode = guardP
            node!.childNode = nil
            guardP!.childNode = node
            guardP = node
        }
        else if node != headP && node != guardP{
            node!.parentNode!.childNode = node!.childNode
            node!.childNode!.parentNode = node!.parentNode
            node!.parentNode = guardP
            node!.childNode = nil
            guardP!.childNode = node
            guardP = node
        }
        return Int(node!.value!)
    }
    func put(_ key: Int, _ value: Int){
        if capacity == 0 {
            return
        }
        if headP == nil {//不存在头指针,且初始容量大于0
            let node = LinkNode()
            node.key = key
            node.value = value
            cacheDic[String(key)] = node
            headP = node
            guardP = node
            usedCapacity += 1
        }
        else{
            if let _ = cacheDic[String(key)] {
                let changeNode:LinkNode = cacheDic[String(key)] as! LinkNode
                changeNode.value = value
                get(key)
                return
            }
            //先进行添加节点
            let node = LinkNode()
            node.key = key
            node.value = value
            node.parentNode = guardP
            guardP!.childNode = node
            cacheDic[String(key)] = node
            guardP = node
            usedCapacity += 1
            if usedCapacity > capacity {//容量不足,需要剔除最久不用的,头节点就是最不常用的节点
                headP!.childNode!.parentNode = nil
                cacheDic.removeValue(forKey: String(headP!.key!))
                headP = headP!.childNode
            }
        }
    }
}

class LinkNode: NSObject {
    var parentNode:LinkNode?//节点父指针
    var childNode:LinkNode?//节点子指针
    var key:Int?//节点key
    var value:Int?//节点value
}
