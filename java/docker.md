#### docker打包部署命令

`docker image`   //查看docker镜像

`cat .env`
`vim .env`   //更改配置文件

`docker-compose stop name`   //暂停容器

`docker-compose rm -f name`   //删除停止的容器

`docker rmi ImageId`  //docker删除镜像文件，需要重新下载最新的包

`docker-compose up -d name`   //重新启动docker，自动下载最新的包

`docker ps|grep pulsar `   //查看与pulsar有关的容器

`docker-compose ps`   //查看运行状况

`docker logs -f`  //查看日志

`docker-compose`