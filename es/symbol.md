#### symbol

##### 概念

`symbol`称为符号对象，是es6中新添加的数据类型，通过`symbol`可以得到一个唯一的值，这个值很适合做标识付。

`Symbol()` function返回一个类型为`symbol`的值，`symbol`具有静态属性，原型上也有`methods`，但是缺少`constructor`，所以不能`new Symbol`来执行

```

let sym = Symbol(); // Symbol中参数为字符串，用来描述。
console.log(typeof sym); //"symbol"

```

##### 特点

1. 具有唯一性

2. Symbol函数前不能使用`new`命令，否则会报错，这是因为生成的Symbol是一个原始类型的值，不是对象

3. Symbol值通过Symbol函数生成，使用typeof，结果为“symbol”

4. instanceof的结果为false

5. Symbol函数可以接受一个字符串作为参数，表示对Symbol实例的描述，主要是为了在控制台显示，或者转为字符串时，比较容易区分

6. 如果Symbol的参数时一个对象，就会调用该对象的toString方法，将其转为字符串，然后才生成一个Symbol值

7. Symbol函数的参数只是表示对当前Symbol值的描述，相同参数的Symbol函数的返回值是不相等的

8. Symbol值可以显式转为字符串

9. Symbol值可以作为标识符，用于对象的属性名，可以保证不会出现同名的属性

```
var mySymbol = Symbol();

// 第一种写法
var a = {};
a[mySymbol] = 'Hello!';

// 第二种写法
var a = {
  [mySymbol]: 'Hello!'
};

// 第三种写法
var a = {};
Object.defineProperty(a, mySymbol, { value: 'Hello!' });

// 以上写法都得到同样结果
console.log(a[mySymbol]); // "Hello!"
```

10. Symbol作为属性名，该属性不会出现在for in，for of循环中，也不会被object.key()，object.getOwnPropertyNames(),JSON.stringify()返回。有一个Object.getOwnPropertySymbols方法，可以获取指定对象的所有Symbol属性名。

11. 如果希望使用同一个Symbol值，可以使用Symbol.for。它接受一个字符串作为参数，然后搜索有木有以该参数作为名称的Symbol值，如果有，就返回这个Symbol值，否则就新建并返回一个以该字符串为名称的Symbol值。

12. Symbol.keyFor方法返回一个已登记的Symbol类型的值key

##### 用途

`symbol`更多是应用于es6规范中，由于它的值具有唯一的特性，可以解决变量名，属性名冲突的问题

并且`symbol`提出了一些属性和方法，用于过渡以及实现一些特殊的用途，比如对象的迭代器，`instanceof`的扩展。