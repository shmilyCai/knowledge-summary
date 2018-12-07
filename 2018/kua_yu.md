
# 前后端分离跨域

一旦项目采用前后端分离，跨域是所有项目里不可避免的问题，目前跨域的解决方案主要有三种


## 采用jsonp方式（只支持GET请求）
## 采用cors方式（支持所有类型的HTTP请求）

CORS，全称是“跨域资源共享”

允许浏览器向跨源服务器，发出XMLHttpRequest请求，从而克服了AJAX只能同源使用的限制

实现CORS通信的关键是服务器，只要服务器实现了CORS接口，就可以跨源通信

浏览器发出CORS请求，就是在头部信息之中，添加一个Origin字段，服务器返回以下内容：

（请求出错后，无法通过状态码识别）

```
Access-Control-Allow-Origin: http://api.bob.com    //必须，表示接受任意域名的请求
Access-Control-Allow-Credentials: true   //可选，表示是否允许发送Cookie
Access-Control-Expose-Headers: FooBar   //可选，
Content-Type: text/html; charset=utf-8
```


## 采用node中间件方式（需要单独部署nodejs服务）
