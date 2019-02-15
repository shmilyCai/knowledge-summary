# redux

https://github.com/kenberkeley/redux-simple-tutorial

Redux，解决应用程序状态（state）管理而提出的一种解决方案

知识点：
1. state，action，reducer
2. 异步逻辑
3. middleware
4. 路由

负责组织state的工具，使用场景：
1. 有着大量的，随时间变化的数据
2. state需要有一个单一个可靠数据来源
3. 把所有state放在最顶层组件中已经无法满足需要


Redux的三个概念：
1. Reducer，负责维护状态，
2. Action，所有的会引发状态更新的交互行为都必须通过一个显性定义的Action来进行
3. Store，负责保存应用状态，提供访问状态的方法，派发action以及对于状态订阅者的注册和取消



## 解决的需求

redux用于解决的用户需求：
1. 在控制台记录用户的每个动作
2. 在上述需求的基础上，记录用户的操作时间
3. 正式上线的时候，把控制台中有关Logger的输出全部去掉
4. 正式上线后，自动收集bug，并还原出当时的场景

将应用中所有的动作与状态都统一管理，让一切有据可循。

## Store

state，是应用的状态，一般本质上是一个普通对象，（个人理解state为数据）

store，是应用状态state的管理者，（个人理解，store为数据库）

store包含的4个函数：
1. getState()，获取整个state
2. dispatch(action)，触发state改变的唯一途径
3. subscrible(listener)，可以理解成是DOM中的addEventListener
4. replaceReducer(nextReducer)，一般在Webpack Code-splitting按需加载的时候用

store和state的关系是：state = store.getState()

Redux的规定：
1. 一个应用只应有一个单一的store，其管理着唯一的应用状态state
2. 不能直接修改应用的状态state，
3. 若要改变state，必须dispatch一个action，

redux生成store的方法：

```
import { createStore } from 'redux'
...
const store = createStore(reducer, initialState) // store 是靠传入 reducer 生成的哦！
```


## action

action只是一个包含type属性的普通对象


## action creator

它可以是同步的，也可以是异步的

它是action的创造者，本质上就是一个函数，返回值是一个action（对象）


它主要用于绑定到用户的操作（点击按钮等），其返回值action用于之后的dispatch（action）

## Reducer

同步的纯函数

用户每次dispatch(action)后，都会触发reducer的执行

reducer的实质是一个函数， 根据action.type来更新state并返回nextState

最后会用reducer的返回值nextState完全替换掉原来的state

## 总结1

1. store由Redux的createStore(reducer)生成
2. state通过store.getState()获取，本质上一般是一个存储着整个应用状态的对象
3. action本质上是一个包含type属性的普通对象，由action creator（函数）产生
4. 改变state必须dispatch一个action
5. reducer本质上是根据action.type来更新state并返回nextState的函数
6. reducer必须返回值，否则nextState即为undefined
7. state就是所有reducer返回值的汇总


## 其他

### 控制反转

在同步场景下，dispatch(action)的这个action中的数据是同步获取的，并没有控制权的切换问题

在异步场景下，则需要将dispatch传入到回调函数，待异步操作完成后，回调函数自行调用dispatch(action)

在异步action creator中自行调用dispatch就相当于反转控制权

### Middleware

引入中间件机制

### 总结2

Redux有5个API，分别是：
1. cretaeStore(reducer, [initialState])
2. combineReducers(reducers)
3. applyMiddleware(...middlewares)
4. bindActionCreators(actionCreators, dispatch)
5. compose(...functions)

createStore生成的store有4个API，分别是：
1. getState()
2. dispatch(action)
3. subscrible(listener)
4. replaceReducer(nextReducer)























