#### substr

##### 页面报错

 ```
TypeError: Cannot read property 'substr' of null
 ```
 
##### 产生原因

`substr()` 方法返回一个字符串中从指定位置开始到指定字符数的字符

此处是调用`substr`的字符串为`null`造成的



##### 解决方案

