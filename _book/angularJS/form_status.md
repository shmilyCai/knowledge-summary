####form_status.md

angularJS将DOM验证的结果保存在$scope对象中，使得我们能够实时做出一些响应。
属性的格式为：

```
formName.inputFieldName.property
```

##### 未修改过的表单
布尔值属性，表示用户是否修改了表单，如果为true，表示没有修改过，false表示修改过
```
formName.inputFieldName.$pristine;
```

##### 修改的表单
布尔值属性，当且仅当用户实际已经修改的表单，不管表单是否通过验证
```
formName.inputFieldName.$dirty;
```

##### 经过验证的表单
布尔值属性，指示表单是否通过验证，
```
formName.inputFieldName.$valid;
```

##### 未通过验证的表单
布尔值属性，指示表单是否通过验证，
```
formName.inputFieldName.$invalid;
```

经过验证的表单和未通过验证的表单的属性用于DOM元素中“确认”按钮是否可以点击
```
<button type="button" class="btn btn-default" data-ng-disabled="form.$invalid">确认</button>
```

##### $error
angularJS 中提供的$error，这个对象包含input的每一个验证是有效的还是无效的，页面中input提示信息均使用这个对象。
验证验证失败，则此属性将是true，如果验证成功，则此属性则是false
```

<input type="text" class="form-control" data-ng-model="name" name="name" required ng-minlength="4"
       ng-pattern="/a-zA-Z/"
       ng-maxlength="16" placeholder="请输入4-16个字符">
 
<div class="form-error" ng-messages="form.name.$error"
     ng-messages-include="app/common/messages.html"></div>
```