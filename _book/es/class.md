#### class

类，作为对象的模版，通过class关键字，定义类

class里定义的方法不用写function，方法与方法之间不要使用逗号，使用后会报错

类和模块的内部，默认是严格模式

类必须使用new调用，否则会报错，这是跟普通构造函数的主要区别，普通构造函数不用new也可以执行

##### 使用

```
一种写法
//定义类
//constructor为构造方法，this则指实例对象
class Point {
  constructor(x, y) {  
    this.x = x;
    this.y = y;
  }

  toString() {
    return '(' + this.x + ', ' + this.y + ')';
  }
}

二种写法
class Point {
  // ...
}

typeof Point // "function"
Point === Point.prototype.constructor // true
```

类的所有方法都定义在prototype

```
class Point {
  constructor() {
    // ...
  }

  toString() {
    // ...
  }

  toValue() {
    // ...
  }
}

// 等同于

Point.prototype = {
  constructor() {},
  toString() {},
  toValue() {},
};
```

在类的实例上调用方法，其实就是调用原型上的方法

```

class B {}
let b = new B();

b.constructor === B.prototype.constructor // true

b是B类的实例，它的constructor方法就是B类原型的constructor
```


```
class Point {
  constructor(){
    // ...
  }
}

Object.assign(Point.prototype, {  //Object.assign方法可以很方便的向类添加多个方法
  toString(){},
  toValue(){}
});
```

##### constructor方法

constructor方法是类的默认方法，通过new命令生成对象的实例时，自动调用该方法

一个类必须有constructor方法，如果没有显示定义，一个空的constructor方法会被默认添加

constructor方法默认返回实例对象（即this）

#### class中的this

class中的this定义在实例的属性上，没有this的都定义在原型上

与ES5一样，类的所有实例共享一个原型对象


#### 类不存在变量提升

必须保证子类在父类之后定义


#### 私有方法和私有属性





















