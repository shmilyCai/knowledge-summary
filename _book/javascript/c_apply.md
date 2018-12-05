# js代码实现apply

apply方法是让对象调用并不存在的方法，改变this指向。

与call类似，区别是apply第二个是由参数组成的数组

```
var testFn = function(){
	alert(this.value);
}

var test = {   //test不存在testFn方法，可以使用call去调用，改变this指向并且testFn执行了
	value:1
};

testFn.apply(test);
```

实现原理：

```
Function.prototype.apply2 = function(context, arr){
	context.fn = this;
	var args = [];

	if(!arr){
		context.fn();
	}else{
		for(var i = 0; i < arr.length; i++){
			args.push(arr[i]);
		}

		context.fn(args);
	}

	delete context.fn;
};

var test = {
	value:1
}

var testFunction = function testFn(name){
	alert(this.value + '-' +name);
}

testFunction.apply2(test, ['hello', 'world']);
```