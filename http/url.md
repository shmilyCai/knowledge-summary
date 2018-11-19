#### URL格式、 HTTP请求、响应、消息

##### <font color="#dd0000">http URL</font>

格式：http://host[:port][abs_path]

http表示要通过http协议来定位网络资源

host表示合法的Internet主机域名或IP地址

port端口号，拥有被请求资源的服务器主机监听该端口的TCP连接，如果为空，则使用缺省的端口80

abs_path指定请求资源的URI（统一资源定位符），如果URI中没有给出abs_path，那么当它作为请求URI时，必须以“/”的形式给出。

http请求由三部分组成，分别是：请求行，消息报头，请求正文

