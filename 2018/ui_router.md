#### ui-router报错误‘Cannot transition to abstract state’

##### 页面报错

```
vendor-887d9f29.js:20917 Error: Cannot transition to abstract state 'fast.mir.computingServices'
```

##### 产生原因

在写路由的时候会配置公用的路由路径（如下代码），此路由为模版路由，没有对应的路径地址，

页面上存在了该路由地址的链接，鼠标点击就会报这个错误

```
.state('fast.mir.computingServices', {
      url: '/computing-services',
      abstract: true,
      ncyBreadcrumb: {
        label: '计算服务'
      }
    })
```

##### 解决方案

该地址不能作为跳转地址，在页面中去掉或者使用其他地址替换