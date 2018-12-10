#### 数组去重-findIndex

findIndex返回数组中满足提供的测试函数的第一元素的索引

## 使用

```
// 模仿地名map
var map = [{ name: '2333', id: '1' }, { name: '666', id: '2' }, { name: '777', id: '3' }, { name: '888', id: '4' }];

// 自己输入后会得到一个数组的最后一个元素
var target = { name: '777', id: '3' };

var index = map.findIndex(function(v){
  return target.id === v.id;
});

map.splice(index, 1);

console.log(map);
```


## for

```

```

## js实现

```
// 模仿地名map
var map = [{ name: '2333', id: '1' }, { name: '666', id: '2' }, { name: '777', id: '3' }, { name: '888', id: '4' }];

// 自己输入后会得到一个数组的最后一个元素
var target = { name: '777', id: '3' };

Array.prototype.findIndex2 = function(fn){
	var self = this;
	console.log('self:' + self.length);
	for(var i = 0; i < self.length; i++){
		if(fn(self[i], i)){
			return i;
		}
	}
}

var index = map.findIndex2(function(v){
	return target.id === v.id
	});

console.log(index);

```