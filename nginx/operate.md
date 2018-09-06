#### 常用操作

启动
`sudo ./nginx`

重新加载
`sudo ./nginx -s reload`

停止
`sudo ./nginx -s stop`

查看nginx进程
`ps -ef | grep nginx`

查看80端口的进程
`losF -i:80`

从容停止nginx
`kill -QUIT 主进程号`

快速停止nginx
`kill -TERM 主进程号`

强制停止nginx
`kill -9 nginx`