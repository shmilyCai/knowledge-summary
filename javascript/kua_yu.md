#### js解决跨域的几种方案

```
URL                      说明       是否允许通信
http://www.a.com/a.js
http://www.a.com/b.js     同一域名下   允许

---

http://www.a.com/lab/a.js
http://www.a.com/script/b.js 同一域名下不同文件夹 允许

---

http://www.a.com:8000/a.js
http://www.a.com/b.js     同一域名，不同端口  不允许

---

http://www.a.com/a.js
https://www.a.com/b.js 同一域名，不同协议 不允许

---

http://www.a.com/a.js
http://70.32.92.74/b.js 域名和域名对应ip 不允许

---

http://www.a.com/a.js
http://script.a.com/b.js 主域相同，子域不同 不允许

---

http://www.a.com/a.js
http://a.com/b.js 同一域名，不同二级域名（同上） 不允许（cookie这种情况下也不允许访问）

---

http://www.cnblogs.com/a.js
http://www.a.com/b.js 不同域名 不允许
```

对于端口和协议的不同，只能通过后台来解决

##### 使用HTML5中新引进的window.postMessage方法来跨域传送数据

##### 使用window.name来进行跨域

##### 通过修改document.domain来跨子域

##### 通过jsonp跨域




