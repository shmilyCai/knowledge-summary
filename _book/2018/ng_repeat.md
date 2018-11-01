#### ng-repeat数组重复


##### 页面报错

 ```
 Duplicates in a repeater are not allowed. 
 ```
 
##### 产生原因

`ng-repeat`数组重复



##### 解决方案

加 track by $index 可解决。

也可以 trace by 任何一个普通的值，只要能唯一性标识数组中的每一项即可（建立 dom 和数据之间的关联）

