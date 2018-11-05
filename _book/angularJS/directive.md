#### 指令

指令是运行在特定dom元素上的函数，用来扩展元素的功能

简版demo：

```
app.directive('myDirective', myDirective);

myDirective.$inject = [];

function myDirective(){
    return {
        restrict: "AE", //何种形式被声明，属性和元素
        template: '', //模版地址
        scope: {}, //
        link: function(){}
    }
}
```

`restrict`

表示指令在dom中以何种形式被声明

 - E 元素，A 属性（默认值），C 类名， M 注释（不建议使用）

`priority `指令优先级，默认为0（最高1000），

- 如果需要同一元素上一个指令比另一个指令先被调用，可给它设置更高的优先级

`template/templateUrl`

指html模版文件

- 调用指令后，模版文件是通过 XHR 来加载的，加载后会缓存到 $templateCache 服务中


- 通过 AJAX 异步加载大量的模版会拖慢一个 Angular 应用的速度。可以提前将模版缓存到一个定义模版的 js 文件中，或者在加载 ng-app 的首页同时将模版以 script 标签加载，然后在配置 template 的地方通过 js 获取

	```
	<script id="pagerTpl" type="text/html">
	    <div>...</div>
	</script>
	
	template: document.querySelector('#pagerTpl').innerHTML
	```

`transclude `

指令定义的内部标签页游标签的时候，设置为 true 可以让子标签的内容保持不变

- transclude 通常用来创建可复用的组件，可以将整个模版，包括其中的指令通过 transclude 全部传入一个指令中。典型的应用是模态对话框或导航栏。

`replace `表示模版会被当作子元素插入到调用此指令的元素内部，设置为 true 时，则指令会被模版替换掉

`scope `

- 为 false，表示指令内和指令外共用同一作用域

- 为 true，表示从父作用域继承并创建一个新的作用域对象

- 常用的通过一个空对象 {}，产生一个隔离作用域，用于创建可复用的组件。组件可以在未知上下文中使用，并且组件所处的外部作用域和内部作用域不会被不经意地污染

存在三种办法让内部的隔离作用域同外部的作用域进行数据绑定

```
<div my-directive age="age"></div>

scope: {
    age: '='   //可以将本地作用域的属性同父级作用域上的属性进行双向绑定
}
```

```
<div my-directive my-name="{{name}}"></div>

// 视图中的 - 连接的属性转换到指令定义中要使用驼峰式
scope: {
    name: '@myName'   //可以将本地作用域同 dom 属性的值进行单向绑定，在使用父作用域中的值对指令中的属性初始赋值后，指令中属性值的修改不会影响父作用域中的值
}
```

```
<div my-directive change="changeName()"></div>

scope: {
    changeName: '&change'   //这是一个绑定函数方法的前缀标识符，通过 & 可以对父级作用域进行绑定，以便在其中运行函数
}
```

`controller`

一般情况下不需要使用指令的 controller，只要使用 link 就够了，controller 和 link 函数可以互换。但它是在预编译阶段执行的（先于 compile）

用 controller 的场景是该指令（a）会被其他指令（b）require 的时候，在 b 的指令里可以传入 a 的这个 controller，目的是为了指令间的复用和交流。而 link 只能在指令内部中定义行为，无法做到这样.

```
controller: function($scope, $ele, $attrs, $transclude){
    ...
}
```

`require`

一般情况下不需要使用 require，它是和 controller 结合用的。require 参数用来引入其他指令或一个指令数组，并将引入指令的 controller 传给 link 函数的第四个参数

`编译 和 链接`

AngularJS 应用启动后，会经历两个阶段。一是编译阶段（compile），对模版 dom 进行转换（指令标签解析和变换），二是链接阶段（link），将作用域和 dom 进行链接（数据绑定）。

`编译-compile `

在编译阶段，AngularJS 会遍历整个 HTML 文档并根据 JavaScript 中的指令定义来处理页面上声明的指令。

编译阶段可以改变原始的 dom（template element），由于此阶段还未对 dom 树进行数据绑定，所以此时对 dom 树操作只需要较少的性能开销。比如 ng-repeat（改变原始 dom 生成多个 dom 节点） 和 ng-transclude（嵌入模版到指令中） 都是在这个阶段对 dom 进行操作。

compile 后，返回一个函数（link）或对象（preLink 和 postLink）。

```
/**
* Compile function
* 
* @param tElem - template element
* @param tAttrs - attributes of the template element
*/
function(tEle, tAttrs){
    ...
}
```

`链接-link`

链接阶段完成作用域和 dom 之间数据的绑定，dom 事件监听器的注册，也是在这个阶段做

```
/**
* pre-link and post-link function
* 
* @param scope - scope associated with this instance
* @param iElem - instance element
* @param iAttrs - attributes of the instance element
*/
function(scope, iElem, iAttrs, ctrl){
    ...
}
```

如果指令定义中有 require 选项，link 的函数签名中还会有第四个参数，代表控制器或所依赖指令的控制器。

两者区别

* compile 是对指令的模板进行转换，link 是在模型和视图之间建立关联（包括注册事件监听）

* compile 对同一个指令的多个实例只会执行一次，link 对于指令的每个实例都会执行一次

* compile 和 link 是互斥的，编写了 compile，自定义的 link 将无效

* 一般情况下只需要编写 link


















