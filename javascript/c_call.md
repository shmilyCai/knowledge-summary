# js实现call


call方法是让对象调用并不存在的方法，改变this指向。

使函数立即执行，调用函数

与apply的区别是，除开第一个为对象外，后面的都是参数列表

```
var testFn = function(){
	alert(this.value);
}

var test = {   //test不存在testFn方法，可以使用call去调用，改变this指向并且testFn执行了
	value:1
};

testFn.call(test);
```


## 实现原理

将新方法添加到对象里，再执行方法，最后删除方法

特点注意call方法的参数不是固定的

```
Function.prototype.call2 = function(context){
	context.fn = this;   //此处的this指的是最后调用的对象，即testFunction
	var args = [];
	for(var i = 1; i < arguments.length; i++){  //arguments用来获取参数
		args.push(arguments[i]);
	}

	alert(args);
	var result = args.join(',');
	context.fn(result);
	delete context.fn;
};

var test = {
	value:1
}

var testFunction = function testFn(name){
	alert(this.value + '-' +name);
}

testFunction.call2(test, 'hello');

```