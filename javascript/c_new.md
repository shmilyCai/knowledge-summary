# js实现new

new运算符创建一个用户定义的对象类型的实例或者具有构造函数的内置对象类型之一

使用方法

```
var People = function(name, age){
	this.name = name;
	this.age = age;
}

People.prototype.say = function(){
	console.log(this.name);
	console.log(this.age);
}

var tester = new People('tester', 12);

tester.say();
```

## 实现

注意点：

1. 传入参数不固定
2. 返回一个对象，并且具有原型上的方法
3. 构造函数的特点：有原型，原型的constructor指向构造函数
4. constructor始终指向创建当前对象的构造函数

```

var People = function(name, age){
	this.name = name;
	this.age = age;
}

People.prototype.say = function(){
	console.log(this.name);
	console.log(this.age);
}

var NewPeople = function(){
	var o = new Object();  //新创建的实例
	Constructor = [].shift.call(arguments); //从arguments中删除第一个值，并且返回第一个值，这里指的是被new的构造函数
	console.log(Constructor);
	o.__proto__ = Constructor.prototype; //将新创建的实例的原型指向构造函数的原型，
	Constructor.apply(o, arguments); //新实例调用构造函数，并传入argument

    return o;
}

var test = NewPeople(People, 'test', 12);

test.say();


```