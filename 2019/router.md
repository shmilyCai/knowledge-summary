# Hash与History路由的区别

hash前端路由，无刷新

history，会去请求接口


浏览器提供了hash和history两种模式：
1. hash，hash虽然出现在URL中，但不会被包含在http请求中，对后端完全没有影响，因此改变hash不会重新加载页面。
2. history，history利用了html5 history interface中新增的pushState()和replaceState()方法。
   这两个方法应用于浏览器记录栈，在当前已有的 back、forward、go 基础之上，它们提供了对历史记录修改的功能。
   只是当它们执行修改时，虽然改变了当前的 URL ，但浏览器不会立即向后端发送请求。