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

以下操作符用于创建Observable对象（返回的是Observable实例），常用的操作符如下：

* create()，
* of()，返回一个Observable实例，用同步的方式把参数中提供的这些值发送出来
* from()，该方法通常用于把一个数组转换成一个（发送多个值的）可观察对象
* fromEvent()，
* fromPromise()，
* empty()，
* never()，
* throw()，
* interval()，
* timer()，

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

## demo

```
// Create simple observable that emits three values //创建observable并广播
const myObservable = of(1, 2, 3);
 
// Create observer object  //创建observer
const myObserver = {
  next: x => console.log('Observer got a next value: ' + x),
  error: err => console.error('Observer got an error: ' + err),
  complete: () => console.log('Observer got a complete notification'),
};
 
// Execute with the observer object  //订阅observable
myObservable.subscribe(myObserver);  //subscribe()方法
// Logs:
// Observer got a next value: 1
// Observer got a next value: 2
// Observer got a next value: 3

```

## 操作符

RxJS定义了一些操作符，比如map()，fliter(), concat() 和flatMap()

操作符接受一些配置项，然后返回一个以来源可观察对象为参数的函数。
当执行这个返回的函数时，这个操作符会观察来源可观察对象中发出的值，转换它们，并返回由转换后的值组成的新的可观察对象。

可以使用管道来组合操作符链接

```
import { filter, map } from 'rxjs/operators';
 
const nums = of(1, 2, 3, 4, 5);
 
// Create a function that accepts an Observable.
const squareOddVals = pipe(
  filter((n: number) => n % 2 !== 0),
  map(n => n * n)
);
 
// Create an Observable that will run the filter and map functions
const squareOdd = squareOddVals(nums);
 
// Suscribe to run the combined functions
squareOdd.subscribe(x => console.log(x));
```

## Rxjs提供的常用操作符

 创建：from, fromPromise, formEvent, of

 组合：combineLatest, concat, merge, startWith, withLatestFrom, zip

 过滤：debounceTime, distinctUntilChanged, filter, take, takeUntil

 转换：bufferTime, concatMap, map, mergeMap, scan, switchMap

 工具：tap

 多播：share

 错误处理：
 1. catchError（允许在管道中处理错误）
 2. retry （尝试失败的请求）

 可观察对象以$符号结尾


## angular中的可观察对象

  EventEmitter类派生自Observable

  HTTP模块使用可观察对象来处理AJAX请求和响应
  
  路由器和表单模块使用可观察对象来监听对用户输入事件的响应

















