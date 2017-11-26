//
//  ReverseLinkedList.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 25/11/2017.
//

import Foundation

class ListNode {
  var val: Int
  var next: ListNode?
  init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

// n1 ->(p1) n2 ->(p2) n3
// n1 <- n2  newhead -> n2 -> n3
func reverseList(_ head: ListNode?) -> ListNode? {
  let nextNode = head?.next
  if head == nil ||  nextNode == nil {
    return head
  }
  let newhead = reverseList(nextNode)
  nextNode?.next = head
  head?.next = nil
  return newhead
}
