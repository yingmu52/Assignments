class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }

  /**
   * @param {any[]} array 
   */
  static fromArray(array) {
    if (array.length === 0) return;
    if (array.length > 1) {
      const node = new ListNode(array[0]);
      node.next = this.fromArray(array.slice(1, array.length));
      return node;
    } else {
      return new ListNode(array[0]);  
    }
  }

  static print(node) {
    if (!node.next) {
      return node.val;
    }
    return this.print(node.next);
  }
}  

module.exports = ListNode;