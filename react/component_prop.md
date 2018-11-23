#### 组件&props

组件可以将UI切分成一些独立的，可复用的部件，这样就只需专注于构建每一个单独的部件。

组件可以接收任意的输入值（称为props），返回一个需要在页面上展示的react元素

##### 函数定义组件

使用function或者class定义组件

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

##### 状态（state）

状态是函数的私有，受控于当前组件。

状态是定义为类的组件的特性

构造函数是唯一能够初始化this.state的地方
















