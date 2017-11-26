//
//  MergeTwoSortedList.swift
//  leetcode
//
//  Created by Xinyi Zhuang on 26/11/2017.
//

import Foundation

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
  guard let L1 = l1 else { return l2 }
  guard let L2 = l2 else { return l1 }
  if L1.val < L2.val {
    L1.next = mergeTwoLists(L1.next, L2)
    return L1
  } else {
    L2.next = mergeTwoLists(L2.next, L1)
    return L2
  }
}
