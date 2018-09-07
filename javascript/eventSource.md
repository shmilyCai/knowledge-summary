#### Server-Sent Events

###### 简介

服务器向客户端推送数据，有很多解决方案。除了“轮询”和webSocket，html5提供了Server-Sent Events(简称为SSE)。

HTTP协议只能客户端向服务器发起请求，服务器不能主动向客户端推送。

但是存在特殊情况，就是服务器向服务端声明，接下来要发送的是流信息（streaming），发送的不是一次性的数据包，而是一个数据流，会连续不断的发送过来。

---

###### 与webSocket比较

是建立浏览器与服务器之间的通信渠道，然后服务器向浏览器推送信息。

WebSocket更强大和灵活，因为它是全双工通道，可以双向通信；

SSE 是单向通道，只能服务器向浏览器发送，因为 streaming 本质上就是下载。

如果浏览器向服务器发送信息，就变成了另一次 HTTP 请求。

SSE优点

```
SSE 使用 HTTP 协议，现有的服务器软件都支持。WebSocket 是一个独立协议。
SSE 属于轻量级，使用简单；WebSocket 协议相对复杂。
SSE 默认支持断线重连，WebSocket 需要自己实现。
SSE 一般只用来传送文本，二进制数据需要编码后传送，WebSocket 默认支持传送二进制数据。
SSE 支持自定义发送的消息类型。
```

---

###### 客户端API

```
var source = new EventSource(url);
```

```
var source = new EventSource(url, { withCredentials: true });
//跨域时，打开withCredentials属性，表示是否一起发送 Cookie
```

EventSource实例的readyState属性，表明连接的当前状态。该属性只读，可以取以下值。

```
var source = new EventSource(url);
console.log(source.readyState);
// 0：相当于常量EventSource.CONNECTING，表示连接还未建立，或者断线正在重连。
// 1：相当于常量EventSource.OPEN，表示连接已经建立，可以接受数据。
// 2：相当于常量EventSource.CLOSED，表示连接已断，且不会重连。
```

EventSource实例的url属性返回连接的网址，该属性只读。

* open事件，可以在onopen属性定义回调函数。

```
source.onopen = function (event) {
  // ...
};

// 另一种写法
source.addEventListener('open', function (event) {
  // ...
}, false);
```

* message事件，客户端收到服务器发来的数据

```
source.onmessage = function (event) {
  var data = event.data;
  var origin = event.origin;
  var lastEventId = event.lastEventId;
  // handle message
};

// 另一种写法
source.addEventListener('message', function (event) {
  var data = event.data;
  var origin = event.origin;
  var lastEventId = event.lastEventId;
  // handle message
}, false);
```

参数对象event有如下属性

```
data：服务器端传回的数据（文本格式）。
origin： 服务器 URL 的域名部分，即协议、域名和端口，表示消息的来源。
lastEventId：数据的编号，由服务器端发送。如果没有编号，这个属性为空。
```

* error事件，如果发生通信错误（比如连接中断）

```
source.onerror = function (event) {
  // handle error event
};

// 另一种写法
source.addEventListener('error', function (event) {
  // handle error event
}, false);
```

* 自定义SSE事件，默认情况下，服务器发来的数据，总是触发浏览器EventSource实例的message事件，这种情况下，发送回来的数据不会触发message事件
```
source.addEventListener('foo', function (event) {
  var data = event.data;
  var origin = event.origin;
  var lastEventId = event.lastEventId;
  // handle message
}, false);
```

* close方法用于关闭 SSE 连接。

```
source.close();
```
