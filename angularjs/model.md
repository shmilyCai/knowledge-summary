####双向绑定

1. 页面中的绑定用双括号
2. input中的绑定ng-model
3. 在页面中写了ng-model的值不能设置为空
4. 在页面绑定数据时，数据在未加载的情况，页面显示双括号，怎么样可以去掉双括号？


在scope之外更新scope的内容，需要使用`$apply`

```
$scope.$apply(function () {});
```