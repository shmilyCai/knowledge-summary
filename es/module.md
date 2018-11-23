#### Module模块

es6模块通过export命令显式指定输出的代码，再通过import命令输入

模块使用编译时加载（静态加载）

ES6模块内自动采用严格模式，无论在头部是否加入`"use strict";`

模块中，顶层的this值为undefined

```
// ES6模块
import { stat, exists, readFile } from 'fs';
```

#### export

命令用于规定模块对外接口

输出可使用as关键字重名

注意：export命令规定的是对外的接口，必须与模块内部的变量建立一一对应的关系。

```
function v1() { ... }
function v2() { ... }

export {
  v1 as streamV1,
  v2 as streamV2,
  v2 as streamLatestVersion
};
```

#### import

命名用于输入其它模块提供的功能

注意：import命令具有提升效果，会提升到整个模块的头部，首先执行。

```
// main.js
import {firstName, lastName, year} from './profile.js';

function setName(element) {
  element.textContent = firstName + ' ' + lastName;
}
```


#### 模块的整体加载

```
import * as circle from './circle';

console.log('圆面积：' + circle.area(4));
console.log('圆周长：' + circle.circumference(14));
```

#### export default命令

```
// export-default.js
export default function () {  //指定为默认输出
  console.log('foo');
}

// import-default.js
import customName from './export-default'; //将导入的文件设置默认的名称
customName(); // 'foo'
```


#### 跨模块常量

const声明的常量只在当前代码块有效

```
// constants.js 模块
export const A = 1;
export const B = 3;
export const C = 4;

// test1.js 模块
import * as constants from './constants';
console.log(constants.A); // 1
console.log(constants.B); // 3

// test2.js 模块
import {A, B} from './constants';
console.log(A); // 1
console.log(B); // 3
```




















