func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
  guard let node1 = t1 else { return t2 }
  guard let node2 = t2 else { return t1 }
  let result = TreeNode(node1.val + node2.val)
  result.left = mergeTrees(t1?.left, t2?.left)
  result.right = mergeTrees(t1?.right, t2?.right)
  return result
}
