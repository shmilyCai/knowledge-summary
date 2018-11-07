#### js基础之词法作用域和动态作用域的常见面试题

作用域面试题

```
for(var i = 0; i < 5; i++) {
  setTimeout(function() {
     console.log(i);			// 5 5 5 5 5
  }, 200);
};
```

这里的 i 是在全局作用域里面的，只存在 1 个值，等到回调函数执行时，用词法作用域捕获的 i 就只能是 5；

因为这个循环计算的 i 值在回调函数结束之前就已经执行到 5 了；我们应该如何让它恢复正常呢？？？

解法一，调用函数，创建函数作用域

```
for(var i = 0; i < 5; i++) {
  abc(i);
};

function abc(i) {
  setTimeout(function() {
     console.log(i);			// 0 1 2 3 4 
  }, 200); 
}
```

解法二，采用立即执行函数，创建函数作用域

```
for(var i = 0; i < 5; i++) {
  (function(j) {
    setTimeout(function() {
      console.log(j);
    }, 200);
  })(i);
};
```

解法三，let创建块级作用域，这种方法最简单

```
for(let i = 0; i < 5; i++) {
    setTimeout(function() {
      console.log(i);
    }, 200);
};
```