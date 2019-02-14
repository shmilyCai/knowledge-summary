# react-学习

react围绕可重用组件的概念设计，定义小组件并将它们组合在一起形成更大的组件。

需要了解的知识点：
1. 路由，react-router
2. 打包工具，webpack
3. npm，nodejs包管理工具
4. css模块，react-css-modules
5. 服务器端渲染，react组件在服务器端渲染出静态html，提高初始化加载的性能，react可重用服务器端渲染出的html，无需客户端重新生成
6. 学习flux，
7. Immutable.js，
8. JSX，允许使用类似html的语法来编写react组件
9. 虚拟DOM（Virtual DOM）
10. Diff算法（虚拟DOM的加速器，提升React性能的法宝）


需要学习的api函数：
1. React.createElement
2. React.Component 
3. React.render()
4. React.createClass()


reactjs与react native的区别：

reactjs是以浏览器DOM作为后端

react native， 以ios或者android原生控件作为后端


## JSX

```
const element = <h1>Hello, world!</h1>;
```

以上称为JSX，即不是字符串，也不是html，一种js的语法扩展。

JSX用于声明react当中的元素。

JSX本身是一种表达式，内部可以使用函数，变量，字符串，可执行方法

Babel转译器会吧JSX转换成react.createElement()的方法调用。

语法规则：遇到HTML标签，以“<”开头，就用html规则解析，遇到代码块，以“{”开头，就用JavaScript规则解析

```
var names = ['Alice', 'Emily', 'Kate'];

ReactDOM.render(
  <div>
  {
    names.map(function (name) {
      return <div>Hello, {name}!</div>
    })
  }
  </div>,
  document.getElementById('example')
);
```

## 元素

元素用来描述在屏幕上看到的内容

```
const element = <h1>Hello, world</h1>;
```

### 使用

```
//在html页面中存在id为root的div，此div中的所有内容由reactDOM管理，称之为根节点
//注意：一般只有一个根节点
<div id="root"></div>

//定义一个元素
const element = <h1>Hello, world</h1>;

//element元素渲染到根DOM节点中，
//通过将element元素加入ReactDOM.render()的方法来将其渲染到页面，
ReactDOM.render(element, document.getElementById('root'));  //将模版转换成html语言
```

当元素被创建之后，是无法改变其内容或属性的，一个元素就好像是动画里的一帧。

更新元素的唯一方法是创建一个新的元素，然后传入` ReactDOM.render()`中。

## 组件

React允许将代码封装成组件，然后像插入普通HTML标签一样，在网页中插入这个组件

### 说明

组件类的名字，第一个字母必须大写，否则会报错；

组件只能包含一个顶层标签，否则也会报错

每个组件类都必须有自己的render()方法，用于输出组件

组件的用法与原生的html标签完全一致，可嵌套

组件内的class属性需要写成className，for属性需要写成htmlFor，这时因为class和for是javasc的保留字

React.createClass方法就用于生成一个组件类

组件并不是真实的DOM节点，存在于内存之中的一种数据结构，叫做虚拟DOM，只有当它插入文档以后，才会变成真实的DOM。根据React的设计，所有的DOM变动，都先在虚拟DOM上发生，然后再将实际发生变动的部分，反映在真实DOM上，这种算法较DOM diff，可以提高网页的性能表现

ref，从组件获取真实DOM节点


组件的生命周期的三个状态：

	Mounting，已插入真实DOM
	Updating，正在被重新渲染
	Unmounting，已移出真实DOM
	每个状态都提供了2种处理函数，will函数在进入状态之前调用，did函数在进入状态之后凋也

### 组件的状态

组件可以将UI切分成一些独立的，可复用的部件，这样就只需专注于构建每一个单独的部件。

组件可以接收任意的输入值（称为props），返回一个需要在页面上展示的react元素

使用function或者class定义组件

#### 函数定义组件

展示组件主要由函数定义，主要负责组件内容如何展示，从props接收父组件传递来的数据

当react遇到的元素是用户自定义的组件时，会将JSX属性作为单个对象传递给该组件，这个对象称为props

```
//定义一个为Welcome的组件
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>; //返回
}

//元素是自定义的组件，将name=“sara”作为props传入并调用Welcome组件
const element = <Welcome name="Sara" />;

//元素element调用并reactDOM启动
ReactDOM.render(
  element,
  document.getElementById('root')
);

```

### extend Component 容器组件

容器组件需要通过类定义组件声明，并包含声明周期函数和其它附加方法

主要关注组件数据如何交互，拥有自身state，从服务器获取数据，或者与redux等其它数据处理协作


### 状态（state）

状态是函数的私有，受控于当前组件。

状态是定义为类的组件的特性

构造函数是唯一能够初始化this.state的地方

### props

组件的属性，可以接受任意值，字符串，对象，函数等


### PropTypes

PropTypes属性，用来验证组件实例的属性是否符合要求


getDefaultProps



## 关键API学习

#### createElement

React.createElemnt会构建一个JavaScript对象来描述html结构的信息，包括标签名，属性，子元素













