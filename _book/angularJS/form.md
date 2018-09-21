#### 表单验证事件

#####禁用H5原生验证

form标签必须有name，novalidate将禁用浏览器自带的验证功能，使用angularJS提供的验证

```
<form name="myForm" ng-submit="submit()" novalidate><form>//禁用了H5原生的提醒
```

##### 错误消息提示统一

表单提供统一的提示内容，内容放在common/message.html页面里，每个需要验证的input后，都必须加上统一的提示

```
<input type="text" class="form-control" data-ng-model="name" name="name" required ng-minlength="4"
   ng-pattern="/a-zA-Z/" ng-maxlength="16" placeholder="请输入4-16个字符">
<div class="form-error" ng-messages="form.name.$error"
 ng-messages-include="app/common/messages.html"></div>

```


##### 焦点触发验证

创建`$scope.focused=false;`，使用ng-focus,ng-blur事件，修改focused状态（分别为获得焦点，失去焦点事件）

```
myForm.username.$error.required //验证失败
```

##### 提交表单验证

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

##### 相关css样式
* ng-pristine //input还未填入数据时
* ng-invalid  //input验证非法时
* ng-dirty    //input已经填入数据时
* ng-valid    //input合法

##### 必填
验证是否输入字符，只需要在标签上加上required
```
<input type="text" required />
```

##### 数字
验证输入的是数字，type设置为number，max设置需要最大的数值，最小的数值为1
```
<input type="number" class="form-control" data-ng-model="number" name="number" max="4094" min="1">

```

##### 最小长度和最大长度
验证输入至少输入的字符数
```
<input type="text" ng-minlength="4"  ng-maxlength="20"/>
```

##### Email
验证输入字符是一个电子邮件
```
<input type="email" name="email" ng-model="" />
```

##### IP验证
验证输入的IP格式
```
<input type="text" class="form-control" data-ng-model="ipNumber" ui-mask="999.999.999.999"  ui-mask-placeholder ui-mask-placeholder-char="_"/>

```

##### 正则匹配
要确保输入匹配的一个正则表达式，使用ng-pattern
```
<input type="text" ng-pattern="/a-zA-Z/" />
	```

##### 验证输入的内容是否已经存在
一般用于名称是否已经被使用，下面有具体的调用后台的案例
```
<div class="form-group" ng-controller="ValidateCtrl">
<label class="col-sm-3 control-label">Email</label>

<div class="col-sm-7">
<input class="form-control" name="email" placeholder="try john.doe@mail.com or bad@domain.com"
       type="email" required ng-model="email" ng-model-options="{ debounce: 500 }"
       data-ui-validate="{duplicated: 'notBlackListed($value)'}"
       ui-validate-async="{duplicated: 'doesNotExist($modelValue)' }">

<div class="form-error" ng-messages="form.email.$error"
     ng-messages-include="app/common/messages.html"></div>
<p class="text-muted">(验证名字是否已经存在列表)</p>
</div>
</div>
.controller('ValidateCtrl', function($scope, $timeout, $q) {
$scope.notBlackListed = function(value) {
var blacklist = ['bad@domain.com', 'verybad@domain.com'];
return blacklist.indexOf(value) === -1;
};
$scope.doesNotExist = function(value) {
var db = ['john.doe@mail.com', 'jane.doe@mail.com'];
return $q(function(resolve, reject) {
  $timeout(function() {
    if (db.indexOf(value) < 0) {
      resolve();
    } else {
      reject();
    }
  }, 500);
});
};
});
```

优化后的：
```
<input name="farm_name" type="text" class="form-control"
   data-ng-model="appStackData.farm.name"
   required
   ng-model-options="{ debounce: 500 }"  //待input输入内容后，有500毫秒的延迟，在执行checkAppStackName
   data-ui-validate="{duplicated : 'checkAppStackName($value)' }">
<div ng-messages="appStack.farm_name.$error" class="form-error"
 data-ng-messages-include="app/views/common/messages.html"></div>

//控制器中的内容
$scope.checkAppStackName = function (name) {
var defered = $q.defer(); //声明延后执行，表示要去监控后面的执行
devApp.get({query: name}, function (resp) {
$log.debug(resp); 
if (resp['success'] && parseInt(resp['total']) > 0) {
  for (var i = 0; i < parseInt(resp['total']); i++) {
    if (resp['data'][i].name === name && resp['data'][i].id !== $scope.appStackData.farmId + '') {
      defered.reject(); //声明执行失败
      return;
    }
  }
  defered.resolve();  //声明执行成功
} else {
  defered.resolve();
}
}, function (error) {
$log.debug(error);
});
return defered.promise; //返回承诺，这里并不是最终数据，而是访问最终数据的API
};
```

##### 密码验证
此处验证2次输入的密码是否相同
```
<section class="col-sm-6">
<div class="form-group">
<label class="col-sm-3 control-label">密码</label>

<div class="col-sm-7">
  <input class="form-control" name="password" type="text" required ng-model="password"
         placeholder="password">
</div>
</div>
<p class="text-center text-muted">以下为2种实现方式</p>
<div class="form-group">
<label class="col-sm-3 control-label">确认密码</label>
//第一种实现方式
<div class="col-sm-7">
  <input class="form-control" name="confirm_password" type="text" required ng-model="confirm_password"
         ui-validate="'$value === password' "
         ng-model-options="{ debounce: 500 }"
         ui-validate-watch=" 'password' " placeholder="confirm password">
  <div ng-show='form.confirm_password.$error'
       ng-messages-include="app/common/messages.html"></div>
  <span ng-show='form.confirm_password.$error.validator' class="form-error">2次输入的密码不一致</span>
</div>
</div>
//第二种实现方式
<div class="form-group">
<label class="col-sm-3 control-label">确认密码</label>
<div class="col-sm-7">
  <input type="text" class="form-control" placeholder="confirm password"
         name="confirmPassword"
         data-ng-model="confirmPassword"
         compare-to="password">
  <div ng-messages="form.confirmPassword.$error"
       ng-messages-include="app/common/messages.html" class="form-error"></div>
</div>
</div>

</section>

//compare-to指令
.directive('compareTo', [
function() {
return {
  require: "ngModel",
  scope: {
    otherModelValue: "=compareTo"
  },
  link: function(scope, element, attributes, ngModel) {

    ngModel.$validators.compareTo = function(modelValue) {
      return modelValue == scope.otherModelValue;
    };

    scope.$watch("otherModelValue", function() {
      ngModel.$validate();
    });
  }
};
}])
```


