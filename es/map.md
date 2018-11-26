#### map

##### 定义

键值对的集合，

“键”的范围不限于字符串，各种类型的值（包括对象）都可以当作键

```
const map = new Map([
  ['name', '张三'],
  ['title', 'Author']
]);

map.size // 2
map.has('name') // true
map.get('name') // "张三"
map.has('title') // true
map.get('title') // "Author"
```

##### 实例的属性和操作方法

```

size，返回map结构的成员总数

set(key, value), 设置键名key对应的键值为value，然后返回整个Map结构，如果key已经有值，则键值会被更新

get(key), 读取key对应的键值，如果找不到key，返回undefined

has(key), 返回一个布尔值，表示某个键是否在当前Map对象之中

delete(key), 删除某个键，返回true，如果删除失败，返回false

clear()， 清楚所有成员，没有返回值

```

##### 遍历方法

```
keys(), 返回键名的遍历器

value(), 返回键值的遍历器

entries(), 返回所有成员的遍历器

forEach(), 遍历Map的所有成员


```







































