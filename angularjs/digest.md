#### angularJS的脏值检查机制

什么叫脏检查？对脏数据的检查，即比较UI和后台的数据是否一致。

只有当出发UI事件，ajax请求或者timeout延迟，才会触发脏检查。

$watch队列，在页面中每绑定一个值就向watch队列加入一条数据

$digest循环，当浏览器接收到可以被angular contexy处理的事件时，digest循环就会触发。分为2个小循环：

	处理evalAsync队列

	处理watch队列

demo

```

app.controller('MainCtrl', function() {
  $scope.name = "Foo";
 
  $scope.changeFoo = function() {
      $scope.name = "Bar";
  }


{{ name }}
<button ng-click="changeFoo()">Change the name</button>
```

* 按下按钮

* 浏览接收到一个事件，进入angular context

* digest循环开始执行，查询每个watch是否变化

* 由于监视sope.name的watch报告了变化，会强制执行一次digest循环

* 新的digest循环没有检测到变化

* 浏览器拿回控制权，更新与scope.name新值到相应的dom


可以通过$apply来进入angular context来执行检查













