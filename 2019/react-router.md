# React-Router

通过管理URL，实现组件的切换和状态的变化

## 基本用法

route组件定义URL路径与组件的对应关系

```
import { Router, Route, hashHistory } from 'react-router';

render((
  <Router history={hashHistory}>
    <Route path="/" component={App}/>
  </Router>
), document.getElementById('app'));
```

## 嵌套路由

```
<Router history={hashHistory}>
  <Route path="/" component={App}>
    <Route path="/repos" component={Repos}/>
    <Route path="/about" component={About}/>
  </Route>
</Router>


export default React.createClass({
  render() {
    return <div>
      {this.props.children}   //this.props.children类似于暂位符
    </div>
  }
})
```

## path属性

Route组件的path属性指定路由的匹配规则

```
<Route path="inbox" component={Inbox}>
   <Route path="messages/:id" component={Message} />
</Route>
```

## 通配符

通配符的规则如下：
1.  :paramName 匹配URL的一个部分，指导遇到下一个/，？，#为止，可通过this.props.params.paramName取出
2.  ()  表示URL的这个部分是可选的
3.  *   表示 * 匹配任意字符，直到模式里面的下一个字符为止，匹配方式是非贪婪模式（？？？）
4.  **  表示匹配任意字符，直到下一个/ ？ # 为止，匹配方式是贪婪模式（？？？）。

路由匹配规则是从上到下执行，一旦发现匹配，就不再使用以后的规则，即写在前面的最先匹配。

## IndexRoute组件

IndexRoute是显示指定根路由的子组件，即指定默认情况下加载的子组件，即类似于某个路径下的index.html

设置父级组件的默认子组件

```
<Router>
  <Route path="/" component={App}>
    <IndexRoute component={Home}/>
    <Route path="accounts" component={Accounts}/>
    <Route path="statements" component={Statements}/>
  </Route>
</Router>
```

## Redirect组件

用于路由的跳转，即用户访问一个路由，会自动跳转到另一个路由

```
Route path="inbox" component={Inbox}>
  {/* 从 /inbox/messages/:id 跳转到 /messages/:id */}
  ＜Redirect from="messages/:id" to="/messages/:id" />
</Route>
```

## IndexRedirect组件

用于组件访问根路由的时候，将用户重定向到某个子组件

```
<Route path="/" component={App}>
  ＜IndexRedirect to="/welcome" />
  <Route path="welcome" component={Welcome} />
  <Route path="about" component={About} />
</Route>
```

## Link

Link组件用于取代<a>元素，生成链接，允许用户点击后跳转到另一个路由。

activeStyle，activeClassName，为路由激活状态设置样式和class

## IndexLink

如果链接到根路由/，使用IndexLink组件

Link组件的onlyActiveOnIndex属性也可得到此效果

## history属性

监听浏览器地址栏的变化，并将URL解析成一个地址对象，供React Router匹配

属性：
	
	browserHistory，路由不再通过Hash完成，而显示正常的路径

	hashHistory，路由将通过URL的哈说部分#切换

	createMemoryHistory，用于服务器渲染，创建一个内存中的history对象，不与浏览器URL互动

## 表单处理

解决表单跳转和点击按钮跳转等操作

方法一：

browserHistory.push(path);

方法二：

this.context.router.push(path);

## 路由钩子

Enter和Leaver钩子，用户进入或者离开该路由时触发

```

<Route path="inbox" component={Inbox}>
  <Route
    path="messages/:id"
    onEnter={
      ({params}, replace) => replace(`/messages/${params.id}`)
    } 
  />
</Route>
```















