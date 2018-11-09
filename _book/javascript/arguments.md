##### arguments

##### <font color="#dd0000">定义</font>

arguments 是一个对应于传递给函数的参数的类数组对象

arguments对象是所有（非箭头）函数中都可用的局部变量。你可以使用arguments对象在函数中引用函数的参数

arguments对象不是一个 Array 。它类似于Array，但除了length属性和索引元素之外没有任何Array属性

---


##### <font color="#dd0000">属性</font>


arguments.callee - 指向当前执行的函数，递归的时候使用这个方法调用替换名称调用

arguments.length - 指向传递给当前函数的参数数量。

arguments[@@iterator] - 返回一个新的Array迭代器对象，该对象包含参数中每个索引的值


