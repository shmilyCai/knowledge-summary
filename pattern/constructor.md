#### 构造函数模式

js中，构造函数通常是用来实现实例的，因为js中没有类的概念，担忧特殊的构造函数

构造函数以大写字母开头，以便于区分普通函数

##### 基本用法

```
function Car(model, year, miles) {
    this.model = model;
    this.year = year;
    this.miles = miles;
    this.output= function () {
        return this.model + "走了" + this.miles + "公里";
    };
}

var tom= new Car("大叔", 2009, 20000);
var dudu= new Car("Dudu", 2010, 5000);

console.log(tom.output());
console.log(dudu.output());
```

以上方法不能很好的实现继承。

##### 调用方法

```
function Car(model, year, miles) {
    this.model = model;
    this.year = year;
    this.miles = miles;
    // 自定义一个output输出内容
    this.output = function () {
        return this.model + "走了" + this.miles + "公里";
    }
}

//方法1：作为函数调用
Car("大叔", 2009, 20000);  //添加到window对象上
console.log(window.output()); // "大叔走了20000公里"

//方法2：在另外一个对象的作用域内调用
var o = new Object();
Car.call(o, "Dudu", 2010, 5000);
console.log(o.output()); 
```

##### 构造函数与原型

```
function Car(model, year, miles) {
    this.model = model;
    this.year = year;
    this.miles = miles;
}

/*
注意：这里我们使用了Object.prototype.方法名，而不是Object.prototype
主要是用来避免重写定义原型prototype对象
*/
Car.prototype.output= function () {
    return this.model + "走了" + this.miles + "公里";
};

var tom = new Car("大叔", 2009, 20000);
var dudu = new Car("Dudu", 2010, 5000);

console.log(tom.output());
console.log(dudu.output());
```























