# RxJS

Observe Pattern（观察者模式）（发布订阅模式）

	定义一对多的关系，让多个观察者对象同时监听某一个主题对象，这个主题对象的状态发生变化时就会通知所有的观察者对象，使得它们能够自动更新自己。

	主要角色：Subject（主题）和Observer（观察者）

	优点：
	1. 支持简单的广播通信，自动通知所有已经订阅过的对象
	2. 目标对象与观察者之间的抽象耦合关系能够单独扩展以及重用

	缺点：
	1. 如果一个被观察者对象有很多的直接和间接的观察者的话，将所有的观察者通知到会话费很多时间
	2. 如果在观察者和观察目标之间有循环依赖的话，观察目标会触发它们之间进行循环调用，可能导致系统奔溃

Iterator Patton（迭代器模式）（游标模式）

	提供一种方法顺序访问一个聚合对象中的各个元素，而又不需要暴漏该对象的内部表示。

	优点：
	1. 简化了遍历方式
	2. 封装性良好，用户只需要得到迭代器就可以遍历，
	缺点：
	遍历过程是一个单向且不可逆的遍历

ES迭代器

	一个迭代器对象，知道如何每次访问集合中的一项，并记录它的当前在序列中所在的位置

	在js迭代器是一个对象，它提供了一个next()方法，返回序列中的下一项，该方法返回done和value两个属性的对象。

	```
	在最后一个元素前：{done: false, value:elementValue}
	在最后一个元素后：{done: true, value:undefined}
	```

 Observables， 作为被观察者，可为值或者事件流

 Observer，作为观察者，根据Observables进行处理

 Obsverables和Observe之间的订阅发布关系：

 	1. 订阅，Observer通过Observable提供的subscrible()方法订阅Obervable
 	2. 发布，Observable通过回调next方法向Observe发布事件

## RxJS-Observable

Observable就是函数，接受Observer作为参数，由返回一个函数。

以下操作符用于创建Observable对象，常用的操作符如下：

* create
* of
* from
* fromEvent
* fromPromise
* empty
* never
* throw
* interval
* timer

## RxJS-Observer

Observer（观察者）是一个包含三个方法的对象，每档Observable触发事件时，便会自动调用观察者的对应方法

```
interface Observer<T> {
  closed?: boolean; // 标识是否已经取消对Observable对象的订阅
  next: (value: T) => void;
  error: (err: any) => void;
  complete: () => void;
}
```

* next，每当Observable发送新值的时候，next方法会被调用
* error，当Observeable内发生错误时，error方法就会被调用
* complete，当Observable数据中指后，complete方法会被调用，在调用complete方法之后，next方法就不会再次被调用






















