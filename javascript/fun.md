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

##### 立即执行函数

立即执行函数为立刻执行的函数，不存在调用自己

```
(function(){
    console.log(1)
})()

或者

(function(){
    console.log(1)
}())

// 有些人叫这个是自执行的匿名函数（即便它不是），因为它没有调用自身，它只是立即执行而已。
(function () { /* code */ } ());

```

##### 自执行函数

自执行函数为自己调用自己的函数

```
// 这是一个自执行的函数，函数内部执行自身，递归
function foo() { foo(); }

// 这是一个自执行的匿名函数，因为没有标示名称
// 必须使用arguments.callee属性来执行自己
var foo = function () { arguments.callee(); };

// 这可能也是一个自执行的匿名函数，仅仅是foo标示名称引用它自身
// 如果你将foo改变成其它的，你将得到一个used-to-self-execute匿名函数
var foo = function () { foo(); };
```

##### 函数表达式立即执行和自执行

```
// 必须使用arguments.callee属性来执行自己
var foo = function () { arguments.callee(); };

// 立即调用的函数表达式（IIFE）也可以自执行，不过可能不常用罢了
(function () { arguments.callee(); } ());
(function foo() { foo(); } ());

```

##### 匿名函数

没有名称的函数

```

```

#### 分组操作符

在一个表达式后面加上（），该表达式立即执行，但是在一个语句后面加上（）后，知识分组操作符

js的（）里面不能包含语句，所以解析器在解析function关键字的时候，会将相应的代码解析成function表达式

```
// 下面这个function在语法上是没问题的，但是依然只是一个语句
// 加上括号()以后依然会报错，因为分组操作符需要包含表达式
 
function foo(){ /* code */ }(); // SyntaxError: Unexpected token )
 
// 但是如果你在括弧()里传入一个表达式，将不会有异常抛出
// 但是foo函数依然不会执行
function foo(){ /* code */ }( 1 );
 
// 因为它完全等价于下面这个代码，一个function声明后面，又声明了一个毫无关系的表达式： 
function foo(){ /* code */ }
 
( 1 );
```



























