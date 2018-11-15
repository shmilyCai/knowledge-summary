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
