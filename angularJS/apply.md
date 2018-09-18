#### $apply

在scope之外更新scope的内容，需要使用`$apply`

```
$scope.$apply(function () {});
```

为什么要使用apply的原因，以及脏检查机制

https://segmentfault.com/a/1190000004523893

#### $digest()和$apply()

```
$scope.$watch('aModel', function ( newValue, oldValue ) {
    // update the DOM with newValue
});
```