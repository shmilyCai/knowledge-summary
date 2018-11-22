#### Module 模式

在es6之前没有单独的模块功能，通过自执行函数和闭包来实现封装。

##### 基本特征

1. 模块化，可重用

2. 封装了变量和function，和全局的namespace不接触，松耦合

3. 只暴露可用的public方法，其它私有方法全部隐藏


#####  基本用法

通过使用闭包方式来封装模块，闭包实现公共的方法和属性

```
var blogModule = (function () {
    var my = {}, privateName = "博客园";

    function privateAddTopic(data) {
        // 这里是内部处理代码
    }

    my.Name = privateName;  //外部可访问Name

    my.AddTopic = function (data) { //外部可访问AddTopid
        privateAddTopic(data);
    };

    return my;
} ());
```

#### 松耦合扩展

每个单独的文件保证以下这个结构，可以实现任意顺序的加载。

```
var blogModule = (function (my) {

    // 添加一些功能   
    
    return my;
} (blogModule || {}));    //传入blogModule变量
```


#### 紧耦合扩展

重载模块中的函数

```
var blogModule = (function (my) {
    var oldAddPhotoMethod = my.AddPhoto;

    my.AddPhoto = function () {
        // 重载方法，依然可通过oldAddPhotoMethod调用旧的方法
    };

    return my;
} (blogModule));
```


#### 子模块

子模块也具有一般模块所有的高级使用方式。

```
blogModule.CommentSubModule = (function () {
    var my = {};
    // ...

    return my;
} ());
```





























