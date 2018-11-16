#### symbol

##### 概念

`ymbol`称为符号对象，是es6中新添加的数据类型，通过`symbol`可以得到一个唯一的值，这个值很适合做标识付。

`Symbol()` function返回一个类型为`symbol`的值，`symbol`具有静态属性，原型上也有`methods`，但是缺少`constructor`，所以不能`new Symbol`来执行

```

let sym = Symbol(); // Symbol中参数为字符串，用来描述。
console.log(typeof sym); //"symbol"

```

##### 特点

1. 具有唯一性

2. 使用`new`关键字是错误的


##### 用途

`symbol`更多是应用于es6规范中，由于它的值具有唯一的特性，可以解决变量名，属性名冲突的问题

并且`symbol`提出了一些属性和方法，用于过渡以及实现一些特殊的用途，比如对象的迭代器，`instanceof`的扩展。