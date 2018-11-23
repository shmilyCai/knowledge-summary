#### 闭包

```
闭包是指那些能够访问自由变量的函数。
自由变量是指在函数中使用的，但既不是函数参数也不是函数的局部变量的变量。
闭包 = 函数 + 函数能够访问的自由变量

闭包就是能够读取其他函数内部变量的函数。 --阮一峰

闭包是指有权访问另一个函数作用域中的变量的函数。 --JavaScript高级程序设计

由于在Javascript语言中，只有函数内部的子函数才能读取局部变量，因此可以把闭包简单理解成"定义在一个函数内部的函数"。

表现为由「一个函数」体中定义了「另个函数」

引用函数的活动对象导致其不能被回收，形成了依然可以用引用访问其作用域链的结果。

闭包是一系列代码块，并且静态保存所有父级的作用域，通过这些保存的作用域来搜寻到函数中的自由变量。

几个函数可能含有相同的父级作用域，在这种情况下，父级作用域的变量是会共享的。
```


##### 用途
1. 读取函数内部的变量
2. 让这些变量的值始终保持在内存中

##### 作用
1. setTimeout/setInterval
2. 回调函数（callback）
3. 事件句柄（event handle）

##### 注意
1. 由于闭包会使得函数中的变量都被保存在内存中，内存消耗很大，所以不能滥用闭包，否则会造成网页的性能问题，在IE中可能导致内存泄露。解决方法是，在退出函数之前，将不使用的局部变量全部删除
2. 闭包会在父函数外部，改变父函数内部变量的值。所以，如果你把父函数当作对象（object）使用，把闭包当作它的公用方法（Public Method），把内部变量当作它的私有属性（private value），这时一定要小心，不要随便改变父函数内部变量的值


在函数中，当你return的是内部function时，就是一个闭包。

```
function greeting(name) {
    var text = 'Hello ' + name; // local variable
    // 每次调用时，产生闭包，并返回内部函数对象给调用者
    return function() { alert(text); }
}
var sayHello=greeting("Closure");
sayHello()  // 通过闭包访问到了局部变量text
```

##### demo

```
var db = (function() {
  // 创建一个隐藏的object, 这个object持有一些数据
  // 从外部是不能访问这个object的
  var data = {};
  // 创建一个函数, 这个函数提供一些访问data的数据的方法
  return function(key, val) {
    if (val === undefined) { return data[key] } // get
    else { return data[key] = val } // set
  }
  // 我们可以调用这个匿名方法
  // 返回这个内部函数，它是一个闭包
})();
db('x');    // 返回 undefined
db('x', 1); // 设置data['x']为1
db('x');    // 返回 1
// 我们不可能访问data这个object本身
// 但是我们可以设置它的成员
```

总结：
1. 在一个函数（outer）内定义了一个函数（inner），通过return 返回inner，即形成闭包。当outer函数执行完后仍然可以访问outer函数的局部变量。

##### 题

```

var data = [];
 
for (var k = 0; k < 3; k++) { //按照作用域的理解，for执行完后，K变成3，
 console.log(k);
  data[k] = function () {
   console.log(k);
  };
}
 
data[0](); // 3, but not 0
data[1](); // 3, but not 1
data[2](); // 3, but not 2
```