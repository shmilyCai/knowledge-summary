#### maven

一个项目管理工具，提供编译的脚本，在整个项目周期中提供测试，发布，文档生成等功能。

```
mvn clean install        //删除再编译
mvn package              //生成target目录，编译、测试代码，生成测试报告，生成jar/war文件 
mvn jetty:run            //运行项目于jetty上, 
mvn compile              //编译 
mvn test                 //编译并测试 
mvn clean                //清空生成的文件 
mvn site                 //生成项目相关信息的网站 
mvn jetty:run            //调用 Jetty 插件的 Run 目标在 Jetty Servlet 容器中启动 web 应用 
mvn compile              //编译你的项目 
mvn clean install        //删除再编译

MVN eclipse:eclipse      //编译打包

```