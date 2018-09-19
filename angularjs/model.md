#### 双向绑定

##### 使用方式 

1. 页面中的绑定用双括号
2. input中的绑定ng-model
3. 在页面中写了ng-model的值不能设置为空
4. 在页面绑定数据时，数据在未加载的情况，页面显示双括号，怎么样可以去掉双括号？

##### 实现原理

数据的双向绑定

脏检查机制

当视图(`view`)中的数据发生变化的时候，作用域下的数据模型(model)也会相应的更新。同样的，无论何时，当数据模型(`model`)发生变化的时候，视图(`view`)也会相应的更新。

当你写这样的一个表达式的时候( `{{ aModel }}` )，AngularJS在背后为这个数据模型(`model`)设置了一个监听器(`watcher`)，正是由于这个监听器(`watcher`)，无论何时当数据模型(`model`)发生变化的时候，视图(`view`)也会更新。这个监听器(`watcher`)与你在AngularJS中设置的其它监听器类似(`watcher`)：

```
$scope.$watch('aModel', function ( newValue, oldValue ) {
    // update the DOM with newValue
});
```

传入$watch()的第二个参数是一个监听函数，并且，无论何时当aModel的值发生改变的时候，他都会被调用

监听器(watcher)是在`$digest`循环中被启用的。当一个监听器(`watcher`)被启用的时候，AngularJS就会去评估数据模型(`model`)，并且，当数据模型(`model`)的值发生改变的时候，就会去调用相应的监听函数。


当运行$scope.$digest()的时候，$digest循环就开始了。假设你通过ng-click指令来调用处理函数来改变一个数据模型(model)，在这种情况下，AngularJS就会自动调用$digest()触发$digest循环。当$digest循环开始的时候，他就会启动每一个监听器(watcher)。这些监听器(watcher)会去检查当前的数据模型(model)中的值是否与最后一次计算的值相同，如果不相同，那么，对应的监听函数就会被执行。结果就是，如果你的视图(view)中有表达式，那么，这些表达式就都会被更新。除了ng-click，还有一些其它的内置指令(或者服务)可以让你改变数据模型(比如ng-model，$timeout等)，并且自动触发$digest循环。

AngularJS并不是直接调用$digest()，而是通过$scope.$apply()然后，相应的调用$rootScope.$digest()。这样做的结果就是，一个$digest循环在$rootScope开始，随后，逐步的遍历所有的子作用域来调用监听器(watcher)。

$digest循环并不只是运行一次。在当前循环的结束之后，他会再次启动来检查是否有数据发生改变。这被叫做脏检查，用来对那些可能被监听函数所更改的数据模型进行监测。所以，$digest循环会一直保持循环直到再也没有数据模型发生改变，或者，到达最大的循环次数(10次)。

