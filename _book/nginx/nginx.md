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


---

```
# 查看nginx.conf配置
cat /etc/nginx/nginx.conf
```
```
user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}
```

```
# 查看default.conf配置
cat /etc/nginx/conf.d/default.conf
```

```
server {
    listen       80;
    server_name  localhost;

    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    #location ~ \.php$ {
    #    root           html;
    #    fastcgi_pass   127.0.0.1:9000;
    #    fastcgi_index  index.php;
    #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
    #    include        fastcgi_params;
    #}

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}
```

整个配置上下文分http、server和location三个层级，分别对应着http请求的全局性配置、server级配置和请求路径级配置。nginx.conf负责http请求的全局配置

default.conf负责具体server及其下具体location的配置。