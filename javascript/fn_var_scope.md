#### js专题之函数作用域与变量作用域的提升

js的作用域仅存在于函数范围内，还存在作用域的提升。

##### <font color="#dd0000">作用域问题</font>

---

js最容易出现混淆的就是作用域的情况。 

块级作用域，就是花括号内就是一个作用域。（在如Java、C、C++等其他语言中，作用域一般为for语句、if语句或{}内的一块区域。）

js的作用域就是函数内作用域，比如if条件语句就不算一个独立的作用域。


```
var x = 1;
console.log(x); // 1
if (true) {
    var x = 2;
    console.log(x); // 2
}
console.log(x); // 2
```

js创建块级作用域的方式是通过自执行函数创建块级作用域。

```
function foo() {
    var x = 1;
    if (x) {
        (function () {
            var x = 2;
            // some other code
        }());
    }
    // x is still 1.
}
```


##### <font color="#dd0000">作用域提升</font>

---

1. 变量提升

对于js解释器而言，所有的函数和变量声明都会被提升到最前面，并且声明永远在前面，赋值在声明过程之后。

```
var x = 10;
function x(){};
console.log(x); // 10
```

实际上被解释为：

```
var x;
function x(){};
x = 10;
console.log(x); // 10
```

2. 函数提升

函数的声明方式主要分为：声明式和变量式。

声明式会自动将声明放在前面并且执行赋值过程。

变量式则是先将声明提升，然后到赋值处再赋值。

```
function test() {
    foo(); // TypeError "foo is not a function"
    bar(); // "this will run!"
    var foo = function () { // function expression assigned to local variable 'foo'
        alert("this won't run!");
    }
    function bar() { // function declaration, given the name 'bar'
        alert("this will run!");
    }
}
test();

```

实际上等于：

```
function test() {
    var foo;
    var bar;
    bar = function () { // function declaration, given the name 'bar'
        alert("this will run!");
    }

    foo(); // TypeError "foo is not a function"
    bar(); // "this will run!"

    foo = function () { // function expression assigned to local variable 'foo'
        alert("this won't run!");
    }
}
test();
```

注意：带有命名的函数变量式声明，是不会提升到作用域范围内的。如：

```
var baz = function spam() {};
baz(); // vaild
spam(); // ReferenceError "spam is not defined"
```

总结：

任何时候，请使用bar声明变量，并放置在作用域的顶端。









