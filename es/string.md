#### 模版字符串

ES6中允许使用反引号` `来创建字符串，此种方法创建的字符串里面可以包含由美元符号加花括号包裹的变量

##### 用法
```
let message = `Hello World`;
console.log(message);

let message = `Hello \` World`;  //如果字符串中有反撇号，使用反斜杠转义
console.log(message);

let message = `    //在模版字符串中，空格，缩进，换行都会被保留
	<ul>
		<li>1</li>
		<li>2</li>
	</ul>
`;
console.log(message);
```

打印出来的模版字符串有换行，可以使用trim


##### 嵌入变量

```
//产生一个随机数
let num = Math.random();
//将这个数字输出到console
console.log(`your num is ${num}`);
```

##### 标签模版

```
let x = 'Hi', y = 'Kevin';
var res = message`${x}, I am ${y}`;
console.log(res);
```