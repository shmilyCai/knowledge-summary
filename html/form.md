### 表单

html5的表单为用户提供了更好的使用体验

##### 新增标签
```
<section>，<article>，<aside>，<footer>，<header>，<nav>
<blockquote>，<details>，<fieldset>，<figure>
```


##### input
input的type元素新特性

* search：呈现为搜索框，换行符会从输入值中去掉。
* tel：呈现为电话号码的输入控件，由于电话号码国际化差异明显，可以使用pattern与maxlength等属性来限制输入的值
* url：呈现为编辑URL的输入控件，换行符与首尾的空格将会被去掉。
* email：呈现为邮件地址，换行符被自动去除（ 若设置multiple属性，`<input>` 区域中可以用逗号分割的方式，输入多个email, 但 Firefox不支持）
* number：呈现为数值的输入
* rang：范围
* data pickers：日期
* min：最小值
* max：最大值
* required：是否必需
* minlength：最短
* maxlength：最长
* pattern：正则表达式