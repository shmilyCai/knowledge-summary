# NGRX

ngrx是一套利用RxJS的类库，其中@ngrx/store就是基于Redux规范制定的Angular2框架

RxJS基于Redux的设计思想，为Angular应用提供强有力的状态管理工具。

## @ngrx/store

核心：

1. state是一个不可变的数据结构
2. action描述state的改变
3. Reducer（纯函数）拿到下一个state和之前的state来计算一个新的state
4. 通过Store访问state，一个可观测state和一个actions观察者

## @ngrx/effects

提供一套API（装饰器@Effect()和Action）来帮助检查Store.dispatch()出来的action。
将特定类型的action过滤出来进行处理，监听特定action，当发现特定的action发出之后，自动执行某些操作，然后将处理的结果重新发送回store中。

核心：

1. 监听派发出来的action
2. 隔离业务和组件
3. 提供新的reducer state（基于网络请求，web socket消息或者time事件驱动）
