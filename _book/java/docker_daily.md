# 常用命令

杀死所有正在运行的容器
docker kill $(docker ps  -q) 

删除所有容器
docker rm $(docker ps -a -q) 

删除所有未打 dangling 标签的镜像，也即没有打名字，只有ID的镜像
docker rmi $(docker images -q -f dangling=true) 

删除所有镜像
docker rmi $(docker images -q) 

清理带hub关键字的所有镜像
docker rmi $(docker images | grep hub |awk 'NR{print $3}')

进入容器
docker exec -it  containerId bash
docker exec -it containerId sh

容器内文件的拷贝
docker cp containerId:/root/test.xml ./test.xml

运行容器
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
Options: 
    -P  所以端口随机映射
    -d   detach 模式运行
    -p   指定映射端口
    -v   挂载数据卷（可能需要安装driver, 如nfs等）

查看容器日志
docker logs -f container

查看容器详情
docker inspect container

查看镜像详情
docker inspect image

重命名容器镜像
docker tag sourceImage targetImage
docker tag hub.chinacloud.com/default/nginx:1.8.1 hub.chinacloud.com/default/nginx:2.0.0