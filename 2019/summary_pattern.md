# 设计模式总结

## 观察者模式（发布订阅模式）

定义：让多个观察者对象同时监听某一个主题对象，这个主题对象的状态发生变化时就会通知所有的观察者对象，使得它们能够自动更新自己

主要角色：Subject（主题）和Observer（观察者）

优点：
1. 支持广播通信，自动通知所有已经订阅过的对象
2. 目标对象与观察者之间的抽象耦合关系能够单独扩展以及重用

缺点：
1. 如果一个被观察者对象有很多的的观察者，将所有的观察者都通知到会花费很多时间
2. 如果在观察者和观察目标之间有循环依赖的话，观察目标会触发它们之间进行循环调用

应用：
1. DOM对象的事件监听


## 迭代器模式（游标模式）

提供一种方法顺序访问一个聚合对象中的各个元素，而又不需要暴露该对象的内部表示。

优点：
1. 简化遍历方式
2. 封住性良好

缺点：
遍历过程是一个单向且不可逆的遍历

ES6中的`Symbol.iterator`可创建对象的内部迭代器
































