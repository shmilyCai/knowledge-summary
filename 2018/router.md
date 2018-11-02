####angularJS中刷新当前页面方法

1. 有些时候好像不管用，忘记什么时候不管用了

```
$state.reload();
```

2. 这个必须知道路由里的参数，如果是全局控制，参数未知

```
$state.go($state.current, {}, {reload: true}); //second parameter is for $stateParams
```

3. 获取路由name，然后加载该路由

```
$state.reload($state.current.name);
```

4.暂时没有使用过，不知道效果，待后续更新效果

```
$state.forceReload();
```

5. 全部刷新页面，暴力解决方法

```
$window.location.reload();
```

6. 
```
$state.transitionTo($state.current, $stateParams, {
	reload: true,
	inherit: false,
	notify: true
});

```

7.
```
$scope.reload = function() {
  return $state.transitionTo($state.current, $stateParams, {
    reload: true
  }).then(function() {
    $scope.hideContent = true;
    return $timeout(function() {
      return $scope.hideContent = false;
    }, 1);
  });
};
```