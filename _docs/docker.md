- [Docker](#Docker)
  - [镜像](#镜像)
    - [列出本机的所有 image 文件](#列出本机的所有-image-文件)
    - [删除 image 文件](#删除-image-文件)
    - [从远程拉去镜像](#从远程拉去镜像)
    - [创建 image 文件](#创建-image-文件)
    - [为本地的image标注用户名和版本](#为本地的image标注用户名和版本)
  - [容器](#容器)
    - [新建并重启](#新建并重启)
    - [后台运行容器](#后台运行容器)
    - [查看后台容器的日志](#查看后台容器的日志)
    - [列出容器列表](#列出容器列表)
    - [终止容器](#终止容器)
    - [重新启动容器](#重新启动容器)
    - [进入正在运行的容器](#进入正在运行的容器)
    - [导入和导出容器](#导入和导出容器)
    - [删除容器](#删除容器)
    - [从 image 文件生成容器](#从-image-文件生成容器)
    - [从 image 文件生成容器](#从-image-文件生成容器-1)
    - [在容器终止运行后自动删除容器文件](#在容器终止运行后自动删除容器文件)
    - [查看容器的输出](#查看容器的输出)
    - [从正在运行的容器中拷贝文件到本地](#从正在运行的容器中拷贝文件到本地)
  - [网络](#网络)
    - [查看应用的端口映射](#查看应用的端口映射)
    - [映射指定端口](#映射指定端口)
    - [映射指定地址的指定端口](#映射指定地址的指定端口)
    - [指定指定地址的任意端口](#指定指定地址的任意端口)
  - [其它](#其它)
    - [发布镜像](#发布镜像)
    - [将镜像保存成本地文件](#将镜像保存成本地文件)
    - [安装本地镜像](#安装本地镜像)
  - [实际例子](#实际例子)
    - [MongoDB](#MongoDB)
    - [Node](#Node)
  - [参考链接](#参考链接)

# Docker
## 镜像
### 列出本机的所有 image 文件
```sh
docker image ls
```

### 删除 image 文件
```sh
docker image rm $imagename
```

### 从远程拉去镜像
```sh
docker image pull $group/$imagename
```

### 创建 image 文件
```sh
docker image build -t $DockerFile[:$version]
```

### 为本地的image标注用户名和版本
```sh
docker image tag $imagename $username/$repository:$tag

# 实例
docker image tag koa-demo:0.0.1 [group]/[imagename:version]
```

## 容器

### 新建并重启
```sh
# 运行脚本之后终止容器
docker run $imagename /bin/echo "Hello World"

# 启动一个交互的终端
# -t,--tty 启动一个伪终端；-i,--interactive 保持容器的标准输入
docker run -it $imagename /bin/bash


# 启动已经终止的容器
docker container start $imagename
```

### 后台运行容器
```sh
# -d,--detach 后台运行容器
docker run -d $imagename
```

### 查看后台容器的日志
```sh
docker container logs $imagename
```

### 列出容器列表
```sh
# 正在运行的容器
docker container ls

# 包括已经停止的容器
docker container ls --all
```

### 终止容器
当 Docker 容器中指定的应用终结时，容器也会自动终结

```sh
docker container stop $imagename
```

### 重新启动容器
```sh
# 启动终止的容器
docker contianer start $imagename

# 重新启动运行状态的容器
docker container restart $imagename
```

### 进入正在运行的容器
```sh
# 从伪终端退出会导致容器退出
docker attch  $containerid

# 不会因为从伪终端退出导致容器退出
docker exec -it $containerid bash
```

### 导入和导出容器
```sh
# 到处某个容器的快照
docker export $containerid > $name.tar

# 从容器快照导入为镜像
cat $name.tar | docker import - $repository/$imagename
```

### 删除容器

```sh
# 删除处于终止状态的容器
docker container rm $containername

# 删除运行中的容器
docker container rm -f $contianername

# 清理所有处于终止状态的容器
docker container prune
```

### 从 image 文件生成容器
```sh
docker container run -p 8000:3000 -it $DockerFile /bin/bash
```

### 从 image 文件生成容器
```sh
docker container run -p 8000:3000 -it $DockerFile[:$version] /bin/bash
```

### 在容器终止运行后自动删除容器文件
```sh
docker cotainer run --rm -p 8000:3000 -it koa-demo /bin/bash
```

### 查看容器的输出
```sh
docker container logs $containerID
```

### 从正在运行的容器中拷贝文件到本地
```sh
docker container cp $containerID:$path
```

## 网络

外部容器的访问容器的网络应用，通过 `-P` 和 `-p` 参数指定端口映射。

`-P` 随机映射 `49000-49900` 的端口到内部开房的网络端口。

`-p` 支持的格式`ip:hostPort:containerPort | ip::containerPort | hostport:containerPort`

### 查看应用的端口映射

```sh
docker container ls -l

docker logs -f $containername

docker port $containername $contaienrport
```

### 映射指定端口

```sh
# 映射指定端口
# $1-主机端口; $2-容器端口;
docker container -p $hostport:$contaienrport -d $imagename $command

# 指定多个端口
docker container -p $hostport:$contaienrport -p $hostport:$contaienrport -d $imagename $command
```

### 映射指定地址的指定端口

```sh
# 映射到 localhost 的指定端口
docker run -p 127.0.0.1:$hostport:$containerport -d $imagename $command
```

### 指定指定地址的任意端口

```sh
# 绑定 localhost 的地址的任意端口
docker run -p 127.0.0.1::$containerport -d $imagename $command

# 指定 udp
docker run -p 127.0.0.1::$containerport/udp -d $imagename $command
```

## 其它

Ctrl + c 停止 node 进程
Ctrl + d （或 exit）退出容器

### 发布镜像
```sh
# 登录
docker login

# 发布
docker image push $username/$repository:$tag
```

### 将镜像保存成本地文件
```sh
docker save -o $filename.tar $imagename
```

### 安装本地镜像
```sh
docker load --input $filename.tar
```

## 实际例子

### MongoDB
> [资料来源](https://hub.docker.com/_/mongo)
```sh
# 从 27017 端口启动数据库
# $1-指定容器的名字; $2-选择的容器名字
docker run --name $containername -d mongo

# 指定随机端口到主机
docker run -P --name $containername -d mongo

# 指定端口映射到容器端口
docker run -p $hostPort:$containerPort --name $containername -d mongo

# 指定多个端口
docker run -p $hostPort:$containerPort -p $hostPort:$containerPort --name $containername -d mongo

# 指定用户名和密码
docker run -p $hostPort:$containerPort --name $containername -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=admin12 3456 -d mongo

# 共享数据
# 注意：对于 windows 系统，通过虚拟机的 Docker ,不能共享到 windows 的共享目录中
docker run -p $hostPort:$containerPort -v $hostpath:containerpath --name $containername -d $imangename
```

### Node
```sh
# 拉去最新的 node 镜像
docker pull node

# 新建并重启一个 node 容器
docker run -it -p $hostport:$containerport -v $hostpath:$apppath --name $containername -d node
```

## 参考链接
1. [Docker 从入门到事件](https://www.cntofu.com/book/139/index.html)