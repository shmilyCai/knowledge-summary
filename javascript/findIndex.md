#### 数组去重-findIndex

```
// 模仿地名map
var map = [{ name: '2333', id: '1' }, { name: '666', id: '2' }, { name: '777', id: '3' }, { name: '888', id: '4' }];

// 自己输入后会得到一个数组的最后一个元素
var target = { name: '777', id: '3' };

var index = map.findIndex(function(v){
  return target.id === v.id;
});

map.splice(index, 1);
```