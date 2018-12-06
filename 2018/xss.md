# angularJS关于input输入框xss攻击说明

## Bug

存储型 XSS 漏洞，像输入框中输入`<script>alert(1)</script>`

## 产生原因

经过多次测试bug发现该问题存在于消息的弹出执行了命令。

angular-toastr插件支持弹出内容包含HTML，并解析执行命令。

toastr插件的配置在产品one-ui的config.js中配置如下：

```
  .config(function (toastrConfig) {
      angular.extend(toastrConfig, {
        closeButton: true,
        allowHtml: true,  //运行html导致该问题产生，必须设置为false
        progressBar: true,
        timeOut: 8000
      });
   })
```

经测试，卫士通和产品中均存在该问题

## 解决方法

将`allowHtml: false`，可解决问题，待验证测试


## 扩展学习

$sce，Strict Contextual Escaping（严格的上下文模式），

$sce提供了将可能存在跨站风险的内容(包括html,url,css,js,resourceUrl)标记为被信任的内容

1. angularJS在ng-modal绑定值时，会使用$sce进行安全检查，检查不过会报相关的错误，

2. angularJs中需要展示html，需要使用进行转化$sce.trustAsHtml()

3. $sce不支持在页面中绑定时执行js





























