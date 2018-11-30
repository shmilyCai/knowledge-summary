#### promise

es6新添加的promise

场景：

在开发中通过调用后端api接口后，需要根据调用后的接口的数据做参数再调用其他接口，这个时候需要使用promise。


```
doA( function(){
    doB();

    doC( function(){
        doD();
    } )

    doE();
} );

doF();
```

回调存在问题：

1. 回调函数执行多次

2. 回调函数没有执行

3. 回调函数有时同步执行有时异步执行


##### promise讲解

promise只能成功或者失败一次，而不能成功或者失败2次，也不能从成功转为失败或从失败转为成功

如果promise已成功或失败，并且您之后添加了成功/失败回调，则将会调用正确的回调，即使事件发生在先。

promise的三种状态：

pending 等待状态

resolve 完成状态

reject 拒绝状态

状态的规定：

1. 状态的变更时不可逆的

2. 等待状态可以变成完成或者拒绝

创建promise：

```
var promise = new Promise(function(resolve, reject) {
  // do a thing, possibly async, then…

  if (/* everything turned out fine */) {
    resolve("Stuff worked!");
  }
  else {
    reject(Error("It broke"));
  }
});
```

promise构造函数包含一个参数和一个带有resolve和reject两个参数回调。

使用示例：

```
promise.then(function(result) {
  console.log(result); // "Stuff worked!"
}, function(err) {
  console.log(err); // Error: "It broke"
});
```

then包含两个参数：一个用于成功情形的回调和一个用于失败情形的回调。

##### promise方法

```
promise.all();

promise.race();

promise.reject();

promise.resolve();
```

##### promise用法

```
Promise.all([loadSomething(), loadAnotherthing()])
.then(function ([something, another]) {
    DoSomethingOnThem(...[something, another]);
});

```

##### 存在问题

1. 一旦建立就不能取消

2. 当处于pending状态时，无法得知目前进展到哪一个阶段

3， promise只能有一个完成值和一个拒绝值
