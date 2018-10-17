#### 模态对话框使用方法及常见问题解决

关于angularJS中的angular-bootstrap的modal弹出框问题

---
modal框弹出方式一

使用正常的`data-ng-click`事件进行弹出

优点：`modal`框的`‘nbNewVolumeCtrl’`控制器中的`scope`与父级的控制器是相同的,可以互相使用`$scope`中的数据

缺点：当在页面中点出弹出框，点击浏览器的页面前进，后退或者在浏览器中直接重新输入`login`地址，弹出框会一直存在页面中，

```
$scope.openModal = function(){
    $scope.modalInstance  = $modal.open({
    templateUrl: 'app/components/volumes/volumes.new.html',
    controller: 'nbNewVolumeCtrl',
    backdrop: 'static',
    scope: $scope
    });
}
```
---

modal框弹出方式二

将`modal`写成路由形式

优点：当`modal`框打开的时候，点击浏览器的前进和后退，弹出框随之关闭，弹出框会根据路由的地址，打开该弹出框

缺点：与父级控制器传参数时，只能通过路由的方式传递参数，并且传递的参数要在浏览器地址栏中显示。

```
//路由
.state('user.organization.space.app.info.summary.addService', {
  url: '/category',
  template: '<div ui-view></div>',
  controller: 'userAddServiceCtrl',
  onEnter: showAddServiceModal
})
//onEnter中写入需要弹出的弹出框地址
function showAddServiceModal($modal, $previousState) {
  $modal.open({
    templateUrl: 'views/user/features/service/addService.html',
    backdrop: 'static',
    controller: ''
  })
}
```

modal框弹出方式一优化方案

由于XXXX系统采用的弹出方式一，并且XXXX系统中很多部分都适用的是弹出框，所以针对方式一进行优化。

该优化必须去掉modal控制器与父级控制器之间相通的`scope: $scope`，通过`items`来传递需要通过父级传递到modal控制器的参数。

```
$scope.items = ['item1', 'item2', 'item3']; ／／需要传递的参数
 
$scope.openModal = function(){
    $scope.modalInstance  = $modal.open({
    templateUrl: 'app/components/volumes/volumes.new.html',
    controller: 'nbNewVolumeCtrl',
    backdrop: 'static',
    //scope: $scope ，／／如'$modalInstance.close()'不起作用时，必须去掉这句代码，
    resolve: {
        items: function () {
          return $scope.items; ／／返回传递的参数
        }
      }
    });
}
  
//监听浏览器的变化，当浏览器的路由变化时，使得弹出框关闭
 $scope.$on('$routeChangeStart', function(){  //此处的$routeChangeStart也可换成$destroy
    $modalInstance.close();
  });
  
//弹出框的控制器
.controller('nbNewVolumeCtrl', function ($scope, $modalInstance, items) { //此处需要注入items
 
  $scope.items = items; //从父级传递的参数
  $scope.selected = {
    item: $scope.items[0]
  };
 
  $scope.ok = function () {
    $modalInstance.close($scope.selected.item);
  };
 
  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
});

```







