#### js基础之执行上下文栈

##### 执行上下文

```
当js代码执行一段可执行代码时，会创建对应的执行上下文。

可执行代码分为：全局代码，函数代码，eval代码。

当执行到一个函数的时候，就会进行准备工作，这里的“准备工作”，让我们用个更专业一点的说法，就叫做"执行上下文(execution context)"。

```

##### 执行上下文栈

```
JavaScript 引擎创建了执行上下文栈（Execution context stack，ECS）来管理执行上下文。

```

当执行一个函数的时候，就会创建一个执行上下文，并且压入执行上下文栈，当函数执行完毕的时候，就会将函数的执行上下文从栈中弹出。

为了模拟执行上下文栈的行为，让我们定义执行上下文栈是一个数组。

```
ECStack = []

```

试想当 JavaScript 开始要解释执行代码的时候，最先遇到的就是全局代码，所以初始化的时候首先就会向执行上下文栈压入一个全局执行上下文，我们用 globalContext 表示它，并且只有当整个应用程序结束的时候，ECStack 才会被清空，所以程序结束之前， ECStack 最底部永远有个 globalContext

```
ECStack = [
    globalContext
];
```

demo:

```
function fun3() {
    console.log('fun3')
}

function fun2() {
    fun3();
}

function fun1() {
    fun2();
}

fun1();
```

当执行一个函数的时候，就会创建一个执行上下文，并且压入执行上下文栈，当函数执行完毕的时候，就会将函数的执行上下文从栈中弹出。知道了这样的工作原理，让我们来看看如何处理上面这段代码：

```
// 伪代码

// fun1()
ECStack.push(<fun1> functionContext);

// fun1中竟然调用了fun2，还要创建fun2的执行上下文
ECStack.push(<fun2> functionContext);

// 擦，fun2还调用了fun3！
ECStack.push(<fun3> functionContext);

// fun3执行完毕
ECStack.pop();

// fun2执行完毕
ECStack.pop();

// fun1执行完毕
ECStack.pop();

// javascript接着执行下面的代码，但是ECStack底层永远有个globalContext
```

---


一个执行上下文可以激活另一个上下文，就好比一个函数调用了另一个函数（或者全局的上下文调用了一个全局函数）。然后一层一层调用下去。

激活其它上下文的某个上下文被称为调用者（caller），被激活的上下文被称为被调用者（callee）。

被调用者同时也可能是调用者。


##### 进入执行上下文

声明阶段

当进入执行上下文时，VO包含下列属性：

函数的所有形参

	--由名称和对应值组成的一个变量对象的属性被创建，没有传递对应的参数话，那么由名称和undefined值组成的一种变量对象的属性也将被创建

所有函数的声明

	--由名称和对应的值（函数对象）组成一个变量对象的属性被创建，如果变量对象已经存在相同名称的属性，则完全替换这个属性。

	--函数表达式不会被声明，

所有变量的声明

	--由名称和对应值组成一个变量对象的属性被创建，如果变量名称跟已经声明的形式参数或函数参数相同，则变量声明不会干扰已经存在的这类属性。


```
alert(x); // function，x在执行之前先被声明为函数
 
var x = 10;
alert(x); // 10
 
x = 20;
 
function x() {};
 
alert(x); // 20
```

##### 执行代码

赋值阶段

```
if (true) {
  var a = 1;
} else {
  var b = 2; //虽然代码不执行，但是仍然被声明为undefined
}
 
alert(a); // 1
alert(b); // undefined,不是b没有声明，而是b的值是undefined
```

##### 关于变量

任何时候，变量只能通过使用var关键字才能声明。

变量不能用delete操作符直接删除变量属性

```
alert(a); // undefined
alert(b); // "b" 没有声明
 
b = 10;
var a = 20;
```

```
alert(a); // undefined, 这个大家都知道，
 
b = 10;
alert(b); // 10, 代码执行阶段创建
 
var a = 20;
alert(a); // 20, 代码执行阶段修改
```









