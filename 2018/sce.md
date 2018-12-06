#### $sce报错

 ##### 页面报错

 ```
 Uncaught Error: [$sce:itype] Attempted to trust a non-string value in a content requiring a string: Context: html
 ```

##### 产生原因

`toastr.success(Object)`

`toastr`不能弹出`Object`类型的数据，会出现`$sec`报错

`$sec`，Strict Contextual Escaping（严格的上下文模式）


##### 解决方案
 
 `$sce`提供了一种将可能存在跨站风险的内容(包括html,url,css,js,resourceUrl)标记为被信任的内容

 ```
 $scope.items = data[0];
 ```
 
```
$scope.items = $sce.trustAsHtml(data);
```

```
$scope.items = data.toString();
```