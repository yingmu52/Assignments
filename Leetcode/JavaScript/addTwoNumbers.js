const ListNode = require('./ListNode');

/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
let carryOver = 0;

const addTwoNumbers = function(l1, l2) {

};

const sumNode = (l1, l2, carry = 0) => {
  let sum = l1.val + l2.val + carry;
  if (sum > 10) {
    sum = 0;
    return [new ListNode(sum), sum - 10]
  } 
  return [new ListNode(sum), 0]
}

const l1 = ListNode.fromArray([7, 2, 4, 3]);
const l2 = ListNode.fromArray([5, 6, 4]);
const result = addTwoNumbers(l1, l2);
console.log(JSON.stringify(result, null, 2));

