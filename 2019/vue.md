# Vue学习

需要了解的知识点：

1. 指令
2. 双向绑定
3. 组件
	props，父组件向子组件传递数据
4. 生命周期钩子
5. 虚拟DOM
6. 修饰符
7. 计算属性
8. *数据劫持
9. 异步更新队列
10. 响应式原理

## vue重点知识

1. 模版编译成虚拟dom渲染函数
2. 数据绑定
3. 指令
4. 修饰符（作用域指令上的）
5. 计算属性（获取属性时的拦截操作，默认getter操作），侦听属性（）
6. props（向子组件传递数据）
7. 子组件通过$emit向父组件传递消息
8. slot插槽分发内容
9. 插槽
10. keep-alive


## 指定
1. v-if, v-else, v-else-if
2. v-for
3. v-show
4. v-on:click
5. v-model

## Vuex

1. Vue components，Vue组件，HTML页面上，负责接收用户操作等交互行为，执行dispatch方法触发对应action进行回应
2. dispatch，操作行为触发方法，是唯一能执行action方法
3. actions，操作行为处理模块，负责处理Vue Component接收到的所有交互行为。包含同步/异步操作，支持多个同名方法，按照注册的顺序依次触发，向后台api请求的操作就在这个模块中进行，包括触发其他action以及提交mutation的操作，该模块提供了promise的封装，以支持action的链式触发
4. commit，状态改变提交操作方法，对mutation进行提交，是唯一能执行mutation的方法
5. mutations，状态改变操作方法，是Vuex修改state的唯一推荐方法，其他修改方式在严格模式下将会报错，该方法只能进行同步操作，而且方法名只能全局唯一。
6. state，页面状态管理容器对象，集中存储Vue components中data对象的零散数据，全局唯一，以进行统一的状态管理。页面显示所需要的数据从该对象中进行读取，利用Vue的细粒度数据响应机制来进行高效的状态更新
7. getters，state对象读取方法，Vue component通过该方法读取全局的state对象

总结：
Vue组件接收交互行为，调用dispatch方法触发action相关处理，若页面状态需要改变，则调用commit方法提交mutation修改state，通过getters获取到state新值，重新渲染Vue Components，界面随之更新

















