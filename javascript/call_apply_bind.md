#### call，apply，bind

##### <font color="#dd0000">call 和 apply</font>

在js中，call和apply都是为了改变某个函数运行时的上下文而存在的，即改变函数体内this的指向。

```
func.call(this, arg1, arg2); //call需要参数按顺序传递进去，参数固定

func.apply(this, [arg1, arg2])； //apply是把参数放在数组里，参数不固定

以上相当于this这个对象借用func方法执行函数
```

此处this是你想指定的上下文，可以是任何的js对象。

demo：

```
var  numbers = [5, 458 , 120 , -215 ]; 

var maxInNumbers = Math.max.apply(Math, numbers),   //458

    maxInNumbers = Math.max.call(Math,5, 458 , 120 , -215); //458
    
number 本身没有 max 方法，但是 Math 有，我们就可以借助 call 或者 apply 使用其方法。
    
```


##### <font color="#dd0000">bind</font>

bind()方法与apply和call相似，改变函数体内this的指向。

```
bind()方法会创建一个新函数。当这个函数被调用时，bingd()的第一个参数将作为它运行时的this，之后的一序列参数将会在传递的实参前传入作为它的参数。

var foo = {
    value: 1
};

function bar() {
    console.log(this.value);
}

// 返回了一个函数
var bindFoo = bar.bind(foo); //此处返回的是bar函数，foo是运行环境的this

bindFoo(); // 1


```

