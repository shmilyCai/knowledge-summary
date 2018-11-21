#### 元素

元素用来描述在屏幕上看到的内容

```
const element = <h1>Hello, world</h1>;
```

##### 使用

```
//在html页面中存在id为root的div，此div中的所有内容由reactDOM管理，称之为根节点
//注意：一般只有一个根节点
<div id="root"></div>

//定义一个元素
const element = <h1>Hello, world</h1>;

//element元素渲染到根DOM节点中，
//通过将element元素加入ReactDOM.render()的方法来将其渲染到页面，
ReactDOM.render(element, document.getElementById('root'));
```

当元素被创建之后，是无法改变其内容或属性的，一个元素就好像是动画里的一帧。

更新元素的唯一方法是创建一个新的元素，然后传入` ReactDOM.render()`中。