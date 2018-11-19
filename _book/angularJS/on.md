####angularJS中的消息广播

angularJS中的作用域与页面的层次和嵌套有关，具有很强的结构性。

$rootScope为全局作用域，其他所有的作用域继承自它，

1. $broadcast

   $broadcast的作用是将事件从父级作用域传播至子级作用域,包括自己

   只能向child controller传递event与data
   ```
    $scope.$broadcast('to-child', 'child');
   ```

2. $emit

   $emit的作用是将事件从子级作用域传播至父级作用域,包括自己，直至根作用域。

   只能向parent controller传递event与data
   ```
    $scope.$emit('to-parent', 'parent');
   ```

3. $on

  $on用于在作用域中监控从子级或父级作用域中传播的事件以及相应的数据

   用于接收event与data
   ```
    var toChild = $scope.$on('to-child', function(event,data) {});

    var toParent = $scope.$on('to-parent', function(event,data) {});

    //必须要销毁
    $scope.$on('$destroy', function(){
       toChild();
       toParent();
    })

   ```