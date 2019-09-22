const assert = require("assert");

// 1.1 no additional data structure

const isUnique = aString => {
  let a;
  for (const s of aString) {
    if (a && a === s) {
      return false;
    } else {
      a = s;
    }
  }
  return true;
};

assert.ok(isUnique("abc"), "abc is unique");
assert.ok(!isUnique("abcccc"), "abcccc is not unique");

// 1.2

const checkPermutation = (a, b) => {
  if (a.length != b.length) {
    return false;
  }

  const createDict = aString => {
    const dict = {};
    for (const s of a) {
      dict[s] = dict[s] || 0 + 1;
    }
    return dict;
  };

  const dictA = createDict(a);
  const dictB = createDict(b);

  for (const key of Object.keys(dictA)) {
    if (dictB[key] !== dictA[key]) {
      return false;
    }
  }

  return true;
};

assert.ok(!checkPermutation("abc", "cbaa"));
assert.ok(checkPermutation("abc", "cba"));
