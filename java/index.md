
#### 安装pulsar流程
1. 更新代码
2. 导入文件
3. 更改maven的配置文件，系统不刷新配置文件，需要手动不断的刷新文件
4. 更改jdk为1.8
5. 运行pulsar和pulsar-sidebar
6. 查看后端是否注册成功（pulsar-sidebar为注册后端文件，微服务）(http://172.16.101.251:18087/)


遇见的问题： 项目结构不出现
jdk版本太低
maven不自动更新配置文件


```
 pom.xml

//配置文件修改-更新maven下载文件的目录
   <repositories>
        <repository>
            <id>fast-public</id>
            <url>http://nexus.chinacloud.com.cn/repository/fast-public/</url>
        </repository>
    </repositories>
```


```
 nebula4j-web/src/main/resources/application.development.properties
//消息注册队列

#rabbit mq
rabbit.server=172.16.0.10:5672
rabbit.username=openstack
rabbit.password=huacloudhuacloud
rabbit.message.queue=cai
```