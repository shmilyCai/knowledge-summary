### 点击页面中的button按钮触发校验问题

#### 问题

页面中存在以下这样的多个按钮组成的可点击方法，当点击`selectConfig`时，触发`submitted`为`true`；

实际情况是当点击`apply`时才触发`$submitted`，

浏览器在生成页面时，会将页面中存在的第一个`button`添加`type="submit"`，当点击时触发`$submitted`，此处已设置`type`，但未生效，
这是为什么了？

```
<button class="item cursor-pointer btn" ng-repeat="config in vmConfigs" ng-click="selectConfig(config)"
  ng-class="{'active': config.cpu === paramObj.cpu && config.memory === paramObj.memory,
  'disabled': config.disabled}">{{config.name}}</button>

 <button type="submit" id="btn-deploy" class="btn btn-primary m-r-10" ng-click="apply();" ng-disabled="!form.$valid || form.$submitted ">立即申请</button>

```


#### 修改方案

不采用`button`作为可点击事件，更换成`span`。