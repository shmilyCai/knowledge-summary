#### let和const

##### <font color="#dd0000">块级作用域与函数作用域</font>

块级作用域使用let和const，var存在变量提升作用

函数作用域即在函数内部的作用域，

```
常见的面试题

var funcs = [];
for (var i = 0; i < 3; i++) {
    funcs[i] = function () {
        console.log(i);
    };
}
funcs[0]();  //3
funcs[1]();  //3
funcs[2]();  //3


修改方案：

1. 将var修改为let

var funcs = [];
for (let i = 0; i < 3; i++) {
    funcs[i] = function () {
        console.log(i);
    };
}
funcs[0](); // 0

2. 立即执行函数

var funcs = [];
for (var i = 0; i < 3; i++) {
    funcs[i] = (function(i){
        return function() {
            console.log(i);
        }
    }(i))
}
funcs[0](); // 0
```

##### <font color="#dd0000">临时死区</font>

产生原因：let和const声明的变量不会被提升到作用域顶部，如果在声明之前访问这些变量

若在声明之前的空间则是临时死区。

注意：var声明的变量会提升到作用域顶部



---

##### <font color="#dd0000">参考资料</font>

块级作用域
https://segmentfault.com/a/1190000010754284

解构赋值
https://segmentfault.com/a/1190000010777578