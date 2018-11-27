#### 箭头函数

es6新添加的

#### 基本语法

```
let func = value => value;

let func = function(value){
	return value;
}

---

let func = (value, num) => value * num;

let func = (value, num) => {
    return value * num
};

```

##### 比较

箭头函数与普通函数的主要区别：

1. 没有this

	箭头函数没有this，所以需要通过查找作用域链来确定this的值。

	这就意味着如果箭头函数被非箭头函数包含，this绑定的就是最近一层非箭头函数的this。

2. 没有 arguments
	
	箭头函数没有arguments对象，一般访问的arguments都是外围函数的

3. 不能通过new关键字调用

	js函数有2个内部方法：[[call]]和 [[construct]]

	当通过new调用函数时，执行construct方法，创建一个实例对象，然后再执行函数体，将this绑定道实例上。

	当直接调用的时候，执行[[call]]方法，直接执行函数体。

4. 没有new.target

	因为不能使用new，所以没有new.target

5. 没有原型

	因为不能使用new，所以也没有构建函数的需求

6. 没有super

	没有原型，即不能通过super来访问原型的属性



	