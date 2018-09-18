#### 链式调用和并发调用

##### 并发请求

angularJS体系下，有一个promise的概念，使用好这个功能，我们可以对程序实现良好的流程控制。


```
 $scope.initAllData = function(){
  var allPromise  = $q.all([
      getNetworksList(),
      getImageList(),
      getSecuritygroup(),
      getAvailabilityZone(),
      getKeyPairs()
    ]
  );
  $scope.getQuota();
  allPromise.then(function(values){
    $log.debug("所有并发任务都执行成功，页面可正常使用");
  }, function (error) {
    $log.debug("有请求失败了。");
    $log.debug(error);
  })
};
$scope.initAllData();
```

使我们可以在代码级别知晓请求全部完成的时间，提高程序控制能力

果在声明promise对象时已经声明了错误处理函数，则为了后续引用可以捕捉到其中的错误，需要手动return $q.reject() ,否则外层promise处理函数永远只能处理成功的请求


##### 链式请求

我们某些执行某个请求前，还需要先执行另外一个请求的情况

```
//首先声明2个promise
$scope.getHypervisorPromise = function () {
  return nbHyperService.getHypervisors({
    'pageNo': 1,
    'pageSize': 1000
  }).then(
    function(resp) {
      $scope.hypervisors = resp['data']['results'];
    }
  )
};
  
$scope.getHostPromise = function () {
  if($scope.hosts && $scope.hosts.length > 0){   //这里if-else 处理2种情况，只为对付刷新详情页无法获取到列表页内部的hosts数据的问题。
    var deferred = $q.defer() ;
    deferred.resolve("ok");         //手动声明了一个promise对象，以匹配链式调用的结构。
   return deferred.promise;
  }
  return nbHostService.getHosts({
    'pageNo': 1,
    'pageSize': 1000
  }).then(
    function(resp) {
      $scope.hosts = resp['data']['results'];
    }
  )
};
  
  
$scope.loadHostInfo = function(){       //处理2个请求的链式调用
  $scope.getHostPromise().then(function(){
    return $scope.getHypervisorPromise();   //链式的连接方式
  }).then(function(){
    $scope.host = $scope.getCurrentHost();
    $scope.setHostHypervisor($scope.host, $scope.hypervisors);
    try{
      if($scope.host.hypervisor.hypervisor_type
        && $scope.host["hypervisor"]["hypervisor_type"] == "QEMU"){
        $state.go('system.host.list.info.monitorData');
        $scope.showMonitor = true ;
      }else{
        $state.go('system.host.list.info.log');
      }
    } catch(e) {
      $log.debug("设置hypervisor_type失败，按照不展示监控进行处理");
      $state.go('system.host.list.info.log');
      $scope.showMonitor = false ;
    }
  });
};
 
$scope.loadHostInfo();

```

一定要前一个promise处理完成之后，才会去处理后一个

多层级的链式调用，可能会把逻辑做的非常复杂，特别是在链式的过程种，需要同时处理正确和错误2种情况，因此，我们只使用链式调用的顺序处理能力。为了代码简洁易阅读，最好不要在链式调用过程中去声明错误处理，需要处理错误的，写在promise声明的地方。


<b>简单写法<b>

使用then代替

```
//$http
nbService.get({}).then(function (resp) {}).then(function(){});

 //$resource

configService.query(paramsObj).$promise.then(function(resp){}).then(function(){});

```