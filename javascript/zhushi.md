#### 注释


##### 单行注释

必须独占一行。// 后跟一个空格，缩进与下一行被注释说明的代码一致。

##### 多行注释

避免使用 /.../ 这样的多行注释。有多行注释内容时，使用多个单行注释。

##### 函数/方法注释

函数/方法注释必须包含函数说明，有参数和返回值时必须使用注释标识。；
参数和返回值注释必须包含类型信息和说明；
当函数是内部函数，外部不可访问时，可以使用 @inner 标识

```
/**
 * 函数描述
 *
 * @param {string} p1 参数1的说明
 * @param {string} p2 参数2的说明，比较长
 *     那就换行了.
 * @param {number=} p3 参数3的说明（可选）
 * @return {Object} 返回值描述
 */
function foo(p1, p2, p3) {
    var p3 = p3 || 10;
    return {
        p1: p1,
        p2: p2,
        p3: p3
    };
}

```


##### 文件注释

文件注释用于告诉不熟悉这段代码的读者这个文件中包含哪些东西。 应该提供文件的大体内容, 它的作者, 依赖关系和兼容性信息。

如下:

```
/**
 * @fileoverview Description of file, its uses and information
 * about its dependencies.
 * @author user@meizu.com (Firstname Lastname)
 * Copyright 2009 Meizu Inc. All Rights Reserved.
 */
```
