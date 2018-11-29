#### 代理模式

为其它对象提供一种代理以控制对这个对象的访问

代理模式场景：

1. 远程代理

2. 虚拟代理

3. 安全代理

4. 智能指引

```

// 先声明美女对象
var girl = function (name) {
    this.name = name;
};

// 这是dudu
var dudu = function (girl) {
    this.girl = girl;
    this.sendGift = function (gift) {
        alert("Hi " + girl.name + ", dudu送你一个礼物：" + gift);
    }
};

// 大叔是代理
var proxyTom = function (girl) {
    this.girl = girl;
    this.sendGift = function (gift) {
        (new dudu(girl)).sendGift(gift); // 替dudu送花咯
    }
};
```