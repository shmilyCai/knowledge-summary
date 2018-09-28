#### docker打包部署命令

//查看docker镜像
`docker image`

//更改配置文件
`cat .env`
`vim .env`

//暂停docker镜像
`docker-compose stop name`

//删除docker中的镜像文件
`docker-compose rm -f name`

//启动docker中的镜像
`docker-compose up -d name`

//查看docker中的pulsar进程
`docker ps|grep pulsar `