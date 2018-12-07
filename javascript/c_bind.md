# js实现bind

bing()方法会创建一个新函数。

bind()的第一个参数将作为它运行时的this，之后的一序列参数将会在传递的实参数前传入作为它的参数。

```
var test = {
	value:1
};

var fn = function(name){
	alert(this.value + '-' + name);
};

var testFn = fn.bind(test, 'hello');

testFn();
```

## 注意点

1. 返回一个函数

2. 可以传入参数

## 实现原理

```

var test = {
	value:1
};

var fn = function(name){
	alert(this.value + '-' + name);
};

Function.prototype.bind2 = function(context){
	var self = this;  //这里self指像fn函数

	var args = [];
	for(var i = 1; i < arguments.length; i++){
		args.push(arguments[i]);
	}

	return function(){
		return self.apply(context, args);  //context对象调用fn方法
	}

};

var testFn = fn.bind2(test, 'hello');
testFn();
```

## 思考

1. 当fn不为函数的时候