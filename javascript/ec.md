#### js基础之理解执行上下文

* EC：函数执行环境（即执行上下文），Execution Content
* ECS：执行环境栈，Execution Content Stack
* VO：变量对象， Variable Object
* AO：活动对象，Active Object
* scope chain：作用域链
* 只有函数能创建执行上下文，for循环并不能创建一个局部的上下文

##### 作用域链
当查找变量的时候，会先从当前上下文的变量对象中查找，如果没有找到，就会从父级(词法层面上的父级)执行上下文的变量对象中查找，一直找到全局上下文的变量对象，也就是全局对象。这样由多个执行上下文的变量对象构成的链表就叫做作用域链

可执行代码的类型:

##### 全局代码（Global code）
这种类型的代码是在"程序"级处理的：例如加载外部的js文件或者本地<script></script>标签内的代码。全局代码不包括任何function体内的代码。 这个是默认的代码运行环境，一旦代码被载入，引擎最先进入的就是这个环境。

##### 函数代码（Function code）
任何一个函数体内的代码，但是需要注意的是，具体的函数体内的代码是不包括内部函数的代码。

##### Eval代码（Eval code）
eval内部的代码

---

##### VO/AO

* 变量对象（Variable object）, 是说JS的执行上下文中都有个对象用来存放执行上下文中可被访问但是不能被delete的函数标示符、形参、变量声明等。它们会被挂在这个对象上，对象的属性对应它们的名字对象属性的值对应它们的值但这个对象是规范上或者说是引擎实现上的不可在JS环境中访问到活动对象

* 激活对象（Activation object）, 有了变量对象存每个上下文中的东西，但是它什么时候能被访问到呢？就是每进入一个执行上下文时，这个执行上下文儿中的变量对象就被激活，也就是该上下文中的函数标示符、形参、变量声明等就可以被访问到了

在没有执行当前环境之前，变量对象中的属性都不能访问！但是进入执行阶段之后，变量对象转变为了活动对象，里面的属性都能被访问了，然后开始进行执行阶段的操作。所以活动对象实际就是变量对象在真正执行时的另一种形式


#### <font color="#dd0000">EC</font>

```
代码的执行流程进入内部函数，创建一个新的执行上下文并把它压入执行栈的顶部。浏览器总会执行位于栈顶的执行上下文，一旦当前上下文函数执行结束，它将被从栈顶弹出，并将上下文控制权交给当前的栈
```

创建的细节：

1. 创建函数【当函数被调用，但未执行任何其内部】
	* 创建作用域链
	* 创建变量，函数和参数
	* 求“this”的值
2. 执行阶段
	* 初始化变量的值和函数的引用，执行代码。

将每个执行上下文抽象为一个对象，这个对象具有三个属性：
```
ECObj: {
    scopeChain: { /* 变量对象（variableObject）+ 所有父级执行上下文的变量对象*/ }, 
    variableObject: { /*函数 arguments/参数，内部变量和函数声明 */ }, 
    this: {} 
}
```
