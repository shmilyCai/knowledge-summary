####angularJS中的消息广播

angularJS中的作用域与页面的层次和嵌套有关，具有很强的结构性。

$rootScope为全局作用域，其他所有的作用域继承自它，

1. $broadcast

   只能向child controller传递event与data
   ```
    $scope.$broadcast('to-child', 'child');
   ```

2. $emit

   只能向parent controller传递event与data
   ```
    $scope.$emit('to-parent', 'parent');
   ```

3. $on

   用于接收event与data
   ```
    var toChild = $scope.$on('to-child', function(event,data) {});

    var toParent = $scope.$on('to-parent', function(event,data) {});

    //必须要销毁
    $scope.$on('$destroy', function(){
       toChild();
    })

   ```