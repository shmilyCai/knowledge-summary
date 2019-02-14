# vue-ui

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
6. props（父组件向子组件传递数据）
7. 子组件通过$emit向父组件传递消息，$on绑定接收的消息
8. slot插槽分发内容
9. ref访问子组件的实例
10. 依赖注入


## 指令
1. v-if, v-else, v-else-if
2. v-for
3. v-show
4. v-on:click
5. v-model
6. v-once，创建低开销的静态组件

v-modal与:modal的区别：
    v-modal为双向绑定
    :modal是v-modal的简写

## 插槽

所谓插槽，指父组件中的html或者数据传递到子组件中slot的位置处，

1. 匿名插槽，
    不含名字的插槽
2. 具名插槽，
    带有名字的插槽
3. 作用域插槽，
    父组件模版的所有东西都会在父级作用域内编译，子组件模版的所有东西都会在子级作用域内编译
4. 默认的插槽内容写在slot中

## 动态组件与异步组件

动态组件：使用keep-alive，返回到上次的目录处（具有翻页列表的部分页面）

keep-alive，缓存组件在内存中，再次进入该页面不会重新渲染，用于保存页面的原始状态

异步组件：工厂函数和promise配合使用

## 组件的钩子函数

1. beforeMount
2. created
3. beforeMount
4. mounted
5. beforeUpdate
6. update
7. beforeDestroy
8. destroyed

## 自定义指令的钩子函数

1. bind
2. inserted
3. update
4. componentUpdated
5. unbind

## 过滤器

与angularjs中的过滤器类似

## 异步组件

1. 普通函数异步组件
2. Promise异步组件
3. 高级异步组件
    高级异步组件实现了loading，resolve，reject，timeout 4种状态
    异步组件实现的本质是2次渲染，除了0 delay的高级异步组件第一次直接渲染成loading组件外，其他都是第一次渲染生成一个注释节点，当异步获取组件成功后，再通过foreceRender强制重新渲染，这样就能正确渲染出我们异步加载的组件了。

## 深入响应式原理

Vue的数据驱动包括数据渲染DOM和数据的变更也触发DOM变化。

计算属性本质上是computer watcher，而侦听属性本质上是user watcher。

对应应用场景：
计算属性适合用在模版渲染中，某个值是依赖了其他的响应式对象甚至是计算属性计算而来的；
侦听属性适用于观测某个值的变化去完成一段复杂的业务逻辑。

当数据发生变化的时候，会触发渲染watcher的回调函数，进而执行组件的更新过程。

## 编译

## 扩展

## Vue Router

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

















