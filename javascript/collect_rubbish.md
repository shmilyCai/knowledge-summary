#### 垃圾回收机制


##### <font color="#dd0000">环境栈</font>
环境栈通俗点就是调用栈，调用移入，调用后移出，垃圾回收则是监听引用。


垃圾回收机制原理：

找出那些不再继续使用的变量，然后释放其占用的内存。因此，垃圾收集器会按照固定的时间间隔（或代码中预定的收集时间），周期性地执行这一操作。

---

##### 为什么会产生垃圾？

局部变量只在函数执行的过程中存在，在这个过程中，会为局部变量在栈内存上分配相应的空间，以便存储它们的值。然后在函数中使用这些变量，直至函数结束。


#### 标记清除

```
“当变量进入环境（例如，在函数中声明一个变量）时，就将这个变量标记为“进入环境”。从逻辑上讲，永远不能释放进入环境的变量所占用的内存，因为只要执行流进入相应的环境，就可能会用到它们。而当变量离开环境时，则将其标记为“离开环境”.
```

#### 引用计数

```
```

#### 解除引用

```
“一旦数据不再有用，最好通过将其值设置为null来释放其引用——这个做法叫做解除引用”
```