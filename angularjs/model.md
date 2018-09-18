#### 双向绑定

##### 使用方式 

1. 页面中的绑定用双括号
2. input中的绑定ng-model
3. 在页面中写了ng-model的值不能设置为空
4. 在页面绑定数据时，数据在未加载的情况，页面显示双括号，怎么样可以去掉双括号？

##### 实现原理

数据的双向绑定

当视图(`view`)中的数据发生变化的时候，作用域下的数据模型(model)也会相应的更新。同样的，无论何时，当数据模型(`model`)发生变化的时候，视图(`view`)也会相应的更新。

当你写这样的一个表达式的时候( `{{ aModel }}` )，AngularJS在背后为这个数据模型(`model`)设置了一个监听器(`watcher`)，正是由于这个监听器(`watcher`)，无论何时当数据模型(`model`)发生变化的时候，视图(`view`)也会更新。这个监听器(`watcher`)与你在AngularJS中设置的其它监听器类似(`watcher`)：

```
$scope.$watch('aModel', function ( newValue, oldValue ) {
    // update the DOM with newValue
});
```

传入$watch()的第二个参数是一个监听函数，并且，无论何时当aModel的值发生改变的时候，他都会被调用

监听器(watcher)是在`$digest`循环中被启用的。当一个监听器(`watcher`)被启用的时候，AngularJS就会去评估数据模型(`model`)，并且，当数据模型(`model`)的值发生改变的时候，就会去调用相应的监听函数


