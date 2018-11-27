#### 变量的结构赋值

ES6允许按照一定模式，从数组和对象中提取值，对变量进行赋值，被称为解构赋值。

##### 数组的结构赋值

数组的元素是按次序排列的，变量的取值由它的位置决定

```
let [foo, [[bar], baz]] = [1, [[2], 3]];
foo // 1
bar // 2
baz // 3

let [ , , third] = ["foo", "bar", "baz"];
third // "baz"

let [x, , y] = [1, 2, 3];
x // 1
y // 3

let [head, ...tail] = [1, 2, 3, 4];
head // 1
tail // [2, 3, 4]

let [x, y, ...z] = ['a'];
x // "a"
y // undefined
z // []
```
##### 对象的结构赋值

对象的属性美元次序，变量必须与属性同名，才能取到正确的值

```
let { bar, foo } = { foo: "aaa", bar: "bbb" };
foo // "aaa"
bar // "bbb"

let { baz } = { foo: "aaa", bar: "bbb" };
baz // undefined
```


##### 用途 

1. 交换变量的值

```
let x = 1;
let y = 2;

[x, y] = [y, x];
```

2. 从函数返回多个值

```
// 返回一个数组

function example() {
  return [1, 2, 3];
}
let [a, b, c] = example();

// 返回一个对象

function example() {
  return {
    foo: 1,
    bar: 2
  };
}
let { foo, bar } = example();
```

























