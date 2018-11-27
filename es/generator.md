#### Genarator

#### 特点

generator函数可以暂停执行和恢复执行，主要用于封装异步。

函数体内外的数据交换和错误处理机制。

generator函数是分段执行的，yield表达式是暂停执行的标记，next方法可以恢复执行

特征

1. function函数关键字与函数名之间有一个星号

2. 函数体内部使用yield表达式

3. 返回一个遍历器对象，即内部指针对象

4. next方法的作用是分阶段执行generator函数。next方法返回一个对象，value属性就是当前yield表达式的值，done属性的false值，表示遍历还没有结束。



```

function* gen(x){
  var y = yield x + 2;
  return y;
}

var g = gen(1);
g.next() // { value: 3, done: false }
g.next() // { value: undefined, done: true }
```


`for...of`语句时不需要next方法

```
function* foo() {
  yield 1;
  yield 2;
  yield 3;
  yield 4;
  yield 5;
  return 6;
}

for (let v of foo()) {
  console.log(v);
}
// 1 2 3 4 5
```