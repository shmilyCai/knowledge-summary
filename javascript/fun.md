#### 函数

#### 函数的声明

函数的声明

```
function test(){}  //这样声明的函数会提升至顶部，即使在最底部声明的，具有相同名称的函数会被覆盖

```

函数表达式

```
var bar = function foo(){}; // 表达式，因为它是赋值表达式的一部分

new function bar(){}; // 表达式，因为它是new表达式

(function foo(){}); // 函数表达式：包含在分组操作符内


var test = function(){} // 这样声明的函数不会提升至顶部，test作为变量提升至顶部
```

如果函数中存在多个闭包，没有手动设置为null，内存不会释放。

##### 自执行函数（立即执行函数）

```
(function(){
    console.log(1)
})()

或者

(function(){
    console.log(1)
}())

```

##### 函数表达式立即执行

```
// 必须使用arguments.callee属性来执行自己
var foo = function () { arguments.callee(); };
```

##### 匿名函数