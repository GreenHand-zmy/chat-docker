# chat-docker
chat聊天app的docker服务

## doccker部署

 在linux或者windows上安装docker和docker-compose 我这里以centos7为例子 
  - 安装docker `sudo yum install docker`
  - 安装docker-compose  `sudo pip install docker-compose`
  - 启动docker `sudo systemctl start docker` 要是出现selinux的错误 关掉selinux就好

### 运行docker
1. 克隆该项目到本地

2. 修改fdfs配置文件
```
修改client.conf
tracker_server=你服务器公网ip:22122

修改mod_fastdfs.conf
tracker_server=你服务器公网ip:22122

修改storage.conf
tracker_server=你服务器公网ip:22122
```
3. 修改nginx配置文件
```
修改nginx.conf
server {
        listen       8888;    ## 该端口为storage.conf中的http.server_port相同
        server_name  你服务器公网ip;
        location ~/fdfs/ {
            ngx_fastdfs_module;
        }

        error_page   500 502 503 504  /50x.html;

        location = /50x.html {
            root   html;
        }
    }
```
### 执行文件

 进入service目录下执行`sh run.sh`,等待几分钟，完成后可以通过`docker ps`查看运行中的镜像.
 
### 注意事项
1. 如果api镜像启动有问题,那么尝试自己去克隆api服务端项目,并maven编译打包之后运行api文件中的Dockerfile。
