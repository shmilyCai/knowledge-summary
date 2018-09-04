#### 表单验证事件

1. 禁用H5原生验证
	在form对象上添加novalidate属性
	```
	<form name="myForm" ng-submit="submit()" novalidate><form>//禁用了H5原生的提醒
	```

2. 焦点触发验证
	创建`$scope.focused=false;`，使用ng-focus,ng-blur事件，修改focused状态（分别为获得焦点，失去焦点事件）
	```
	myForm.username.$error.required //验证失败
	```

3. 提交表单验证：
	创建`$scope.submitted=false;`提交表单时，如果`$scope.form.$invalid===true`,将其设置为true，从而显示错误信息
	```
	$scope.submitted = false;
    $scope.submit = function () {
        if($scope.myForm.$valid){
            $scope.submitted = false;//验证通过时不显示
            //提交表单的行为
        }else{//验证不通过时显示
            $scope.submitted = true;
        }
    }
	```

4.  相关css样式
	* ng-pristine //input还未填入数据时
	* ng-invalid  //input验证非法时
	* ng-dirty    //input已经填入数据时
	* ng-valid    //input合法


