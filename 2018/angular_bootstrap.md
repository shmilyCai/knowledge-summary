#### angularJS启动过程

##### 问题

在产品中出现了这样的代码，位置在index.html中。

为什么要这样写？以及这样写的原因？其中各项是什么意思？

```
<script type="text/javascript">
  angular.element(document).ready(function () {
    angular.bootstrap(document, fastModules.slice(0), {
      strictDi: false
    });
  });
</script>
```

---

##### 分析-angularjs启动的三种方式

- 自动启动

Angular会自动的找到ng-app，将它作为启动点，自动启动

```
<!DOCTYPE html>
  <html ng-app="myModule">
  
  <head>
      <title>New Page</title>
      <meta charset="utf-8" />
      <script type="text/javascript" src="../../vendor/bower_components/angular/angular.min.js"></script>
      <script type="text/javascript" src="./02.boot1.js"></script>
  </head>
  
  <body>
      <div ng-controller="MyCtrl">
          <span>{{Name}}</span>
      </div>
  </body>
  </html>

```

```

  var myModule = angular.module("myModule", []);
  myModule.controller('MyCtrl', ['$scope',
      function($scope) {
          $scope.Name = "Puppet";
      }
  ]);

```

- 手动启动

在没有ng-app的情况下，只需要在js中添加一段注册代码即可

```
  <body>
      <div ng-controller="MyCtrl">
          <span>{{Name}}</span> 
      </div>
  </body>
```

- JS启动

```
var myModule = angular.module("myModule", []);
  myModule.controller('MyCtrl', ['$scope',
      function($scope) {
          $scope.Name = "Puppet";
      }
  ]);
  
  /**
   * 这里要用ready函数等待文档初始化完成
   */
  angular.element(document).ready(function() {
      angular.bootstrap(document, ['myModule']);
  });
```

- 多个ng-app

ng中，angular的ng-app是无法嵌套使用的，在不嵌套的情况下有多个ng-app，他默认只会启动第一个ng-app，第二个第三个需要手动启动(注意，不要手动启动第一个，虽然可以运行，但会抛异常

```
<body>
      <div id="app1" ng-app="myModule1">
          <div ng-controller="MyCtrl">
              <span>{{Name}}</span>
          </div>
      </div>
      <div id="app2" ng-app="myModule2">
          <div ng-controller="MyCtrl">
              <span>{{Name}}</span>
          </div>
      </div>
  </body>

```
```
/**
   * 第一个APP
   * @type {[type]}
   */
  var myModule1 = angular.module("myModule1", []);
  myModule1.controller('MyCtrl', ['$scope',
      function($scope) {
          $scope.Name = "Puppet";
      }
  ]);
  // angular.element(document).ready(function() {
  //     angular.bootstrap(app1, ['MyModule1']);
  // });
  
  /**
   * 第二个APP
   * @type {[type]}
   */
  var myModule2 = angular.module("myModule2", []);
  myModule2.controller('MyCtrl', ['$scope',
      function($scope) {
          $scope.Name = "Vincent";
      }
  ]);
  angular.element(document).ready(function() {
      angular.bootstrap(app2, ['myModule2']);
  });
```


