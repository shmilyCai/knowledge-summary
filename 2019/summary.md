# 前端各个框架分析与总结

“但考虑到前端发展日新月异，工具的迭代更新非常快，希望读者可以识别什么是不变的，什么是变化的，从而选择合适的开发工具。”

-- 偶然看到这句话，需要思考什么是不变的，什么是变化的，目前看来各个框架的API是变化的，但各个框架的思想与解决问题的思路是不变的。

-- 因此出现了这篇的分析与总结

说明：

用简洁的语言描述出各个框架解决的问题，解决问题的基本原理和流程，重要API，最后记忆用于应付面试

详细的API不用深入了解，因为这些API都是可以通过文档查看的，没有必要花费太多的时间来记忆，因为人的精力是有限的。

-- 待后面再深入学习框架吧

```
###  解决的问题
###  原理/核心概念
###  重要点/重要API

（每个总结限制字数）
```

## AngularJS

### 解决的问题


###  原理/核心概念

	脏值检查，检查model值是否发生了变化。
	双向绑定原理：遍历每个数据的$watcher，比较新旧值，当新旧值不同时，触发更新操作
	angularjs在scope模型上设置了监听队列，用来监听数据变化。当绑定数据到view上时angularjs会往$watcher队列里插入一条$watch，用来监视model里的内容是否有变化，当浏览器接收到可以被angular context处理的事件时，$digest循环被触发，遍历所有的$watch，最后更新dom

###  重要API

	指令，
	服务，（service，factory，provide）
	控制器，负责用户的输入并把执行过程代理给对应的服务
	依赖注入，注入需要的文件
	过滤器，


## Angular

###  解决的问题
###  原理/核心概念
###  重要点/重要API

	组件，
	服务，
	依赖注入，
	服务端渲染，
	管道，
	分区，
	单向数据流，
	脏值检测，

## RxJS

###  解决的问题

	使异步代码和回调代码变得简单
	实现方式：使用观察者模式和迭代器模式以函数式编程思维实现的。

###  原理/核心概念

	Observables，是一个函数
		接收一个Observe对象，包含next，error，complete方法的对象作为参数
		返回一个unsubscrible函数，用于取消订阅
	Observer，一个函数，具有next，error，complete方法
		next，Observables发送新值的时候，被调用
		error，Observables内发生错误时，被调用
		complete，Observables数据终止后，被调用
	两者之间的订阅发布关系：
	订阅：Observer通过Obserables提供的subscrible()方法订阅Observable
	发布：Observable通过回调next方法向observer发布事件
	Operators-操作符，是个函数，主要用于创建Observable
		接收一个Observable对象，返回一个新的Observable对象


###  重要点/重要API

## React

###  解决的问题

	构建可复用组件来构建用户界面，只是视图UI库

###  原理/核心概念

	虚拟DOM：（将DOM抽象为虚拟DOM，即一个对象）
		Virtual DOM即对象，一棵树，与DOM树对应
		当state更新时，通过diff算法寻找到需要变更的DOM节点，并只对变化部分进行更新。
		Virtual DOM中的新树与旧树进行比较后，更新对象树后，再将数据patch更新到DOM树中

	Diff算法：

###  重要点/重要API

	JSX：类似于html，使用jsx创建组件，实现组件化开发
	组件：可复用并存在生命周期，state（组件中的数据），props（子组件接收父组件传递的数据）
	数据流是从上往下：从父组件到子组件

## Redux

###  解决的问题

	统一管理项目中所有的数据，让数据变得可控

	严格的单向数据流

###  原理/核心概念

	Action：
	action创建的函数：
	Reducer：指定了应用状态的变化如何响应actions并发送到store中
	Store：

	三大原则：
	1. 单一数据源，应用中的所有state储存在一棵object tree中
	2. state是只读的，唯一改变state的方法就是触发action
	3. 使用纯函数来执行修改，需要使用reducers

###  重要点/重要API




















