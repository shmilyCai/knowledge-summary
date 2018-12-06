# js模拟实现bind

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

注意点：

1. 返回一个函数

2. 可以传入参数

实现原理：

```
```