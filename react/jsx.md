#### jSX

```
const element = <h1>Hello, world!</h1>;
```

以上称为JSX，即不是字符串，也不是html，一种js的语法扩展。

JSX用于声明react当中的元素。

JSX本身是一种表达式，内部可以使用函数，变量，字符串，可执行方法

Babel转译器会吧JSX转换成react.createElement()的方法调用。

语法规则：遇到HTML标签，以“<”开头，就用html规则解析，遇到代码块，以“{”开头，就用JavaScript规则解析

```
var names = ['Alice', 'Emily', 'Kate'];

ReactDOM.render(
  <div>
  {
    names.map(function (name) {
      return <div>Hello, {name}!</div>
    })
  }
  </div>,
  document.getElementById('example')
);
```


















