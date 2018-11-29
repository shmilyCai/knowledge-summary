#### 工厂模式

使用场景：

1. 对象的构建十分复杂
2. 需要依赖具体环境创建不同实例
3. 处理大量具有相同属性的小对象

基本用法：

```
var productManager = {};

productManager.createProductA = function () {
    console.log('ProductA');
}

productManager.createProductB = function () {
    console.log('ProductB');
}
        
productManager.factory = function (typeType) {
    return new productManager[typeType];
}

productManager.factory("createProductA");
```