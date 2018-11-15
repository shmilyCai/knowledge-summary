#### angularJS的$watch

angularJS的脏检查机制首先通过
$watch是一个scope函数，用于监听模型变化，当模型部分发生变化时通知你。

##### 参数说明

```
$watch(watchFn,watchAction,deepWatch)
```

watchFn，监听的对象，它可以是一个angular表达式，如name或者function

watchAction(newValue,oldValue,scope)，哇推出F你发生变化会被调用

deepWatch，监听的布尔值命令检查被监控的对象的每个属性是否发生变化

$watch会返回一个函数，注销这个watch可以使用函数

##### 相关函数

$watchGroup，监听对象为数组

$watchCollection，监听对象为一堆数据

##### demo

```
$scope.name = 'hello';
var watch = $scope.$watch('name',function(newValue,oldValue, scope){
        console.log(newValue);
        console.log(oldValue);
});
$timeout(function(){
        $scope.name = "world";
},1000);
```

##### 性能

太多的$watch将会导致性能问题，如果不在使用，最好将其释放掉。