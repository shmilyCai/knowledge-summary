#### 原型模式

利用js特有的原型继承特性去创建对象的方式，也就是创建的一个对象作为另外一个对象的prototype的属性值

注意浅拷贝与深拷贝的问题

```

// 因为不是构造函数，所以不用大写
var someCar = {
    drive: function () { },
    name: '马自达 3'
};

// 使用Object.create创建一个新车x
var anotherCar = Object.create(someCar);  //Object.create运行直接从其它对象继承过来
anotherCar.name = '丰田佳美';
```

```
var vehicle = {
    getModel: function () {
        console.log('车辆的模具是：' + this.model);
    }
};

var car = Object.create(vehicle, {     //Object.create中的第二个参数使用对象字面量传入要初始化的额外属性
    'id': {
        value: MY_GLOBAL.nextId(),
        enumerable: true // 默认writable:false, configurable:false
 },
    'model': {
        value: '福特',
        enumerable: true
    }
});
```



















