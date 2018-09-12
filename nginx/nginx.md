####Nginx接入原理分析

轻量级，高性能的 HTTP 和 反向代理 服务器

通过配置文件将客户端请求映射到一个 `location block`（location 是 Nginx配置中的一个指令，用于 `URL `匹配），而在这个 location 中所配置的每个指令将会启动不同的模块去完成相应的工作

---

Nginx 的模块从结构上分为：

核心模块：`HTTP` 模块、 `EVENT` 模块和 `MAIL` 模块

基础模块： `HTTP Access` 模块、`HTTP FastCGI` 模块、`HTTP Proxy` 模块和 `HTTP Rewrite`模块，

第三方模块：`HTTP Upstream Request Hash` 模块、 `Notice` 模块和 `HTTP Access Key`模块

---

Nginx启动

`conf` 存放配置文件

`html` 网页文件

`logs` 存放日志

`sbin` 启动、停止等脚本