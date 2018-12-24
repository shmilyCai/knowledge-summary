# 环境搭建

1. git clone
2. 切换分支
3. 添加Lombok插件，重启intelliJ
4. bootstrap.yml需改注册中心

```
#spring.profiles.active: @profileActive@

info:
  name: "one-infrastructure-api"
  description: "one-infrastructure-api"

logging:
  level:
    ROOT: INFO
    org.springframework.web: INFO
spring:
  application:
    name: one-infrastructure-api-cyl
  cloud:
    config:
      username: oneconfig
      password: oneconfig123
      discovery:
        enabled: true
        serviceId: one-config
      failFast: true  # Will not start service if no config server found
      env: default # optional
      label: develop # optional
#      uri: http://172.16.2.68:8888/
      retry:
        initial-interval: 1000
        max-attempts: 60
        max-interval: 10000
eureka:
  instance:
    preferIpAddress: true
  client:
    serviceUrl:
      defaultZone: ${eurekaUrl}

swagger: 
  enabled: true
  title: One-Infrastructure-Api
  description: One-Infrastructure微服务API文档
  version: V1.0.0
  base-package: cetc.chinacloud.co.fast.onex.infrastructure.web
  base-path: /**

```


5.  添加application.dev.yml到根目录下

 ```
 info:
  name: "mir-infrastructure-api"
  description: "mir-infrastructure-api"

logging:
  level:
    ROOT: INFO
    org.springframework.web: INFO

spring:
  cloud:
    config:
      discovery:
        enabled: false
  application:
    name: one-infrastructure-api-cyl
  datasource:
    url: jdbc:mysql://172.16.2.147:3306/one_infrastructure?autoReconnect=true&createDatabaseIfNotExist=true&characterEncoding=UTF-8
    #url: jdbc:mysql://localhost:3306/one_infrastructure?autoReconnect=true&createDatabaseIfNotExist=true&characterEncoding=UTF-8
    username: root
    password: root
    driver-class-name: com.mysql.jdbc.Driver
  jpa:
    show-sql: true
    format-sql: false
    hibernate:
      ddl-auto: none
  jackson:
    serialization:
      indent_output: true
  rabbitmq:
    addresses: 172.16.0.6:5672
    username: fast
    password: fast
    virtual-host: /

#eureka:
#  instance:
#    preferIpAddress: true
#  client:
#    serviceUrl:
#      defaultZone: http://127.0.0.1:18087/eureka/
flyway:
  locations: db/migration/${vendor:mysql}
  sql-migration-prefix: V
  sql-migration-separator: _
  sql-migration-suffix: .sql
  enabled: false
server:
  context-path: /one-infrastructure-api
  port: 8081
pod:
  logingTimeOut: 1
app:
  port:
    start: 1
    end: 2
monitor:
  prometheus:
    alarminterval: 1
    url: ss
k8s:
  resource:
    tolerance: 1
harbor:
  config:
    registry: ss
keycloak:
  authUrl: http://172.16.2.147/auth
  events: LOGIN,LOGIN_ERROR,LOGOUT,LOGOUT_ERROR
  support_https: false
  admin:
    realm: fast
    clientId: admin-client
    clientSecret: 3b8ac077-e9fc-4f59-a984-67a9526961ba
  user:
    realm: fast
    clientId: user-client
    clientSecret: b1f34b10-dea8-42f0-a5a0-b46a708f75d9
    groupsClaim: group-mapper

#上传的文件根路径
upload:
  path: /opt/server/one-oss/fileUpload

#定期清理临时文件的文件过期天数
clean:
  file:
    expiredDay: 1
client:
  api:
    gxxw: http://127.0.0.1:8081/one-infrastructure-api/api/mock/resource

 ```

