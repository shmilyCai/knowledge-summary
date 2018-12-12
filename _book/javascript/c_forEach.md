# js模拟实现forEach

forEach对提供的每个元素执行一次提供的函数。

参数为：当前每一项（item），索引值（index），原数组（array）


## forEach使用

```

var tests = ['item1', 'item2', 'item3'];
var copys = [];

tests.forEach(function(item){
	copys.push(item);
});

console.log(copys);

```

```

//for循环代替
var tests = ['item1', 'item2', 'item3'];
var copys = [];

for(var i = 0; i < tests.length; i++){
	copys.push(tests[i]);
}
console.log(copys);
```

## js实现

```

var tests = ['item1', 'item2', 'item3'];
var copys = [];

Array.prototype.forEach2 = function(fn){
	var self = this;
	for(var i = 0; i < self.length; i++){
		fn(self[i], i);
	}
};

tests.forEach2(function(item){
	copys.push(item);
});

console.log(copys);

```
