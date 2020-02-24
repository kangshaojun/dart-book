1. 配置开发环境：
    * [MySQL](https://dev.mysql.com/downloads/mysql/)
    * [JDK1.8或以上](http://www.oracle.com/technetwork/java/javase/overview/index.html)
    * [Maven](https://maven.apache.org/download.cgi)
    * [Nodejs](https://nodejs.org/en/download/)

2. 数据库导入shop-db/sql下的数据库文件

3. 启动管理后台的后端服务

    打开命令行，输入以下命令
    ```bash
    cd shop
    mvn install
    mvn clean package
    java -Dfile.encoding=UTF-8 -jar shop-all/target/shop-all-0.1.0-exec.jar
    ```
    
4. 启动管理后台前端

    打开命令行，输入以下命令
    ```bash
    npm install -g cnpm --registry=https://registry.npm.taobao.org
    cd shop/shop-admin
    cnpm install
    cnpm run dev
    ```