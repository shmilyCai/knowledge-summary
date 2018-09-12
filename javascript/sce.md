#### $sce报错

 $sce提供了一种将可能存在跨站风险的内容(包括html,url,css,js,resourceUrl)标记为被信任的内容

 ##### 页面报错

 Uncaught Error: [$sce:itype] Attempted to trust a non-string value in a content requiring a string: Context: html

 ##### 解决方案
 
 ```
 $scope.items = data[0];
 ```

```
$scope.items = $sce.trustAsHtml(data);
```

```
$scope.items = data.toString();
```