#### js中 && 和 || 运算符的用法

写js代码时，也就使用&&和||判断true和false，这次有个运算判断，绕晕了，特地总结下

对于&&和||运算符，一般只会使用到以下的判断：

```
true && true = true;
true && false = false;
false && true = false;
false && false = false;

true || true = true;
true|| false = true;
false || true = true;
false || false  = false;
```

2种运算符的说明，有个特别处(并且&&运算符的优先级大于||运算符)

```
&&的返回值会返回最早遇到以下类型的值：
NaN null undefined 0 false;
```


```
||的返回值会返回最早遇到的非以下类型的值：
NaN null undefined 0 false;
```

##### Demo

对于以下赋值语句，a的值是多少呢？

```
var a=(undefined && 1 ) || (0 || 5)；
```

首先计算undefined && 1，由于&&运算符首先返回NaN、null、undefined、0、false，因此返回undefined。

然后对于0||5，由于||运算符首先返回非NaN、null、undefined、0、false，所以返回5。

最后，undefined||5，显然返回5。
