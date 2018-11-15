#### set数据结构

es6提供的新的数据结构。

类似于数组，但是成员的值是唯一的，没有重复值。

```
let set = new Set();
```

可以接受一个数组（或者具有iterable接口的其他数据结构）作为参数，用来初始化

```
let set = new Set([1, 2, 3, 4, 4]);
console.log(set); // Set(4) {1, 2, 3, 4}

set = new Set(document.querySelectorAll('div'));
console.log(set.size); // 66

set = new Set(new Set([1, 2, 3, 4]));
console.log(set.size); // 4
```

##### 属性和方法

操作方法：

1. add(value)，添加

2. delete(value)，删除

3. has(value)，返回一个布尔值

4. clear()，清楚所有成员

遍历方法：

1. keys()， 返回键名

2. values()， 返回键值

3. entries()，返回键值对

4. forEach()，使用回调函数遍历每个成员，无返回值